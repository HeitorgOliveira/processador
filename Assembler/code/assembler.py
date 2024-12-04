OPCODES = {
    "ADD": "0000",
    "SUB": "0001",
    "AND": "0010",
    "OR": "0011",
    "NOT": "0100",
    "CMP": "0101",
    "JMP": "0110",
    "JEQ": "0111",
    "JGR": "1000",
    "LOAD": "1001",
    "STORE": "1010",
    "MOV": "1011",
    "IN": "1100",
    "OUT": "1101",
    "WAIT": "1110"
}

REGISTRADORES = {
    "A": "00",
    "B": "01",
    "R": "10",
    "L": "11"
}

# Função para ler um arquivo de código assembly e ignorar comentários
def ler_arquivo_assembly(caminho_arquivo):
    try:
        with open(caminho_arquivo, 'r') as arquivo:
            linhas = arquivo.readlines()
        # Remove comentários e linhas vazias
        codigo = [
            linha.split(';')[0].strip()  # Ignora comentários após ';'
            for linha in linhas
            if linha.strip() and not linha.strip().startswith(';')  # Ignora linhas vazias e comentários
        ]
        return codigo
    except FileNotFoundError:
        print(f"Erro: O arquivo '{caminho_arquivo}' não foi encontrado.")
        return []
    except Exception as e:
        print(f"Erro ao ler o arquivo: {e}")
        return []
    
# Função que faz a escrita para uma arquivo .mif de memória
def escrever_mif(codigo, caminho_mif):
    try:
        with open(caminho_mif, 'w') as arquivo:
            arquivo.write("-- Memory Initialization File (.mif)\n")
            arquivo.write("WIDTH=8;\n")
            arquivo.write("DEPTH=256;\n")
            arquivo.write("\n")
            arquivo.write("ADDRESS_RADIX=UNS;\n")
            arquivo.write("DATA_RADIX=BINARY;\n")
            arquivo.write("\n")
            arquivo.write("CONTENT BEGIN\n")
            
            # Escreve as instruções no formato de memória
            for addr, linha in enumerate(codigo):
                arquivo.write(f"  {addr} : {linha};\n")
            
            arquivo.write("END;\n")
        print(f"Arquivo '{caminho_mif}' criado com sucesso.")
    except Exception as e:
        print(f"Erro ao criar o arquivo .mif: {e}")



def identificar_labels(codigo):
    labels = {}
    num_linha = 0
    for line in codigo:
        line = line.split(";")[0].strip()  # Remove comentários e espaços extras
        if not line:
            continue
        # Se for uma label, armazenar o endereço atual
        if ":" in line:
            label = line.replace(":", "")
            labels[label] = num_linha
        else:
            tokens = line.split()
            opcode = tokens[0]
            num_linha += 1  # Instrução ocupa uma linha
            # Adicionar linha extra para literais
            if opcode in ["JMP", "JEQ", "JGR"]:
                num_linha += 1
            if opcode in ["ADD", "SUB", "AND", "OR", "MOV", "CMP", "LOAD", "STORE"]:
                if len(tokens) > 2 and (tokens[2].isdigit() or tokens[1].isdigit()):  # Algum 
                    num_linha += 1
                elif len(tokens) > 1 and tokens[1].isdigit():  # Primeiro argumento é literal
                    num_linha += 1
    return labels

def transformar_numero_binario_ou_inteiro(parametro):
    if len(parametro) == 8 and all(c in "01" for c in parametro):
        # Já é binário: usar diretamente
        return parametro
    # Se o número estiver como um vetor binário "00001101", por exemplo
    else:
        return(format(int(parametro), "08b"))    

def assemble_line(line, num_linha, labels):
    line = line.split(";")[0].strip()  # Remove comentários e espaços extras
    if not line:
        return [], num_linha

    tokens = line.split()
    opcode = tokens[0]  # Primeira palavra é a instrução
    binary_output = []

    if opcode in OPCODES:
        binary_instruction = OPCODES[opcode]
        
        # Se for um rótulo (e.g., LOOP_START:), ignore
        if line.endswith(":"):
            return [], num_linha
        
        primeiro = tokens[1].replace(",", "") if len(tokens) > 1 else ""
        segundo = tokens[2].replace(",", "") if len(tokens) > 2 else ""
        
        # WAIT: sem argumentos
        if opcode == "WAIT":
            binary_output.append(binary_instruction + "0000")
        
        # ADD, SUB, AND, OR, MOV, CMP: 1 ou 2 registradores, podendo um ser literal
        elif opcode in ["ADD", "SUB", "AND", "OR", "MOV", "CMP", "LOAD", "STORE"]:
            if primeiro.isdigit():
                literal = transformar_numero_binario_ou_inteiro(primeiro)
                reg = REGISTRADORES.get(segundo, None)
                binary_output.append(binary_instruction + "11" + reg)
                binary_output.append(literal)
                num_linha += 1  # Literal ocupa uma linha extra
            elif segundo.isdigit():
                literal = transformar_numero_binario_ou_inteiro(segundo)
                reg = REGISTRADORES.get(primeiro, None)
                binary_output.append(binary_instruction + reg + "11")
                binary_output.append(literal)
                num_linha += 1  # Literal ocupa uma linha extra
            else:
                reg1 = REGISTRADORES.get(primeiro, None)
                reg2 = REGISTRADORES.get(segundo, None)
                if ((not reg1) or (not reg2)):
                    raise ValueError(f"Erro na linha {num_linha}: registrador inválido.")
                binary_output.append(binary_instruction + reg1 + reg2)
 
        # NOT, IN, OUT: apenas 1 registrador, obrigatoriamente não-literal
        elif opcode in ["NOT", "IN", "OUT"]:
            reg = REGISTRADORES.get(tokens[1].replace(",", ""), None)
            binary_output.append(binary_instruction + reg + "00")
        
        # JMP, JEQ, JGR: Operações que usam endereço literal
        elif opcode in ["JMP", "JEQ", "JGR"]:
            address_label = tokens[1]
            if address_label in labels:
                address = labels[address_label]
                binary_output.append(binary_instruction + "0000")  # Literal
                binary_output.append(format(address, "08b"))
                num_linha += 1  # Literal ocupa uma linha extra
            else:
                raise ValueError(f"Erro na linha {num_linha}: rótulo '{address_label}' não encontrado.")

    return binary_output, num_linha

def converter_assembly_para_binario(codigo):
    # Primeira passagem para identificar labels
    labels = identificar_labels(codigo)

    binary_code = []
    num_linha = 0
    for line in codigo:
        try:
            linha_binaria, num_linha = assemble_line(line, num_linha, labels)
            binary_code.extend(linha_binaria)
        except ValueError as e:
            print(e)
    
    return binary_code

def escrever_hex(codigo, caminho_hex):
    try:
        with open(caminho_hex, 'w') as arquivo:
            for addr, linha in enumerate(codigo):
                # Converte o binário para hexadecimal
                linha_hex = hex(int(linha, 2))[2:].zfill(2).upper()  # Remove o prefixo '0x', preenche com zeros e deixa maiúsculo
                # Escreve no formato "addr: hex_code"
                arquivo.write(f"{linha_hex}\n")
        print(f"Arquivo '{caminho_hex}' criado com sucesso.")
    except Exception as e:
        print(f"Erro ao criar o arquivo .hex: {e}")


# Alterar a saída para .hex
caminho_saida_hex = "processador/SD_Processador/ram256x8.hex"

# Entrada para o nome de um arquivo fornecido pelo usuário
caminho_entrada = "processador/Assembler/code/"  
nome_arquivo = input("Qual o nome do arquivo? ")
caminho_entrada = caminho_entrada + nome_arquivo
# Saída por padrão para o nome da mif
caminho_saida = "processador/SD_Processador/ram256x8.mif" 
codigo_assembly = ler_arquivo_assembly(caminho_entrada)

codigo_binario = converter_assembly_para_binario(codigo_assembly)
if codigo_binario:
    escrever_mif(codigo_binario, caminho_saida)
    escrever_hex(codigo_binario, caminho_saida_hex)
else:
    print("Nenhum código foi lido ou o arquivo está vazio.")
