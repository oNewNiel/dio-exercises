LIMITE_POR_SAQUE = 500.00
LIMITE_SAQUES = 3


def valor_positivo(valor:str) -> bool:
    if float(valor) <= 0:
        return False
    return True

def deposito(valor:str) -> bool | None:
    if not valor_positivo(valor):
        return print('Valor inválido.')
    
    print('Depósito efetuado.')
    return True

def saque(valor:str, saldo:float, numero_de_saques:int) -> bool | None:
    if not valor_positivo(valor):
        return print('Valor inválido.')

    if numero_de_saques >= LIMITE_SAQUES:
        return print('Número total de saques excedido.')
    
    valor = float(valor)

    if valor > LIMITE_POR_SAQUE:
        return print('Valor inserido acima do limite.')

    if valor > saldo:
        return print('Saldo abaixo do valor solicitado.')

    print('Saque realizado com sucesso.')
    return True

def extrato(operacoes:list[str], saldo):
    if not operacoes:
        return print("Não existem movimentações para conta.")
    
    template = f"""
    {" EXTRATO ".center(40,"#")}
    Saldo: R${saldo:.2f}

    {"#".center(40, "#")}

    Movimentações:

"""
    for operacao in operacoes[::-1]:
        if operacao[0] == '-':
            linha = f"    Saque:    {operacao[0]}R${operacao[1:]}\n"
        elif operacao[0] == '+':
            linha = f"    Depósito: {operacao[0]}R${operacao[1:]}\n"
        else:
            print('Erro encontrado: entre em contato com suporte.')
        
        template += linha
    return template


menu = """
Digite:
1 - para depositar
2 - para sacar
3 - para extrato
0 - para sair

"""

saldo = 0.0
numero_de_saques = 0

operacoes = []

while True:

    opcao = input(menu)

    if opcao == "0":
        break

    if opcao == "1": # <- DEPOSITO
        valor = input('Qual valor gostaria de depositar?\n\n')
        
        if not deposito(valor):
            continue

        saldo += float(valor)
        operacoes.append("+" + valor)
    
    if opcao == "2": # <- SAQUE
        valor=input('Qual valor gostaria de sacar?\n\n')

        if not saque(valor, saldo, numero_de_saques):
            continue
        
        numero_de_saques += 1
        operacoes.append("-" + valor)
        saldo -= float(valor)
        
    
    if opcao == "3": # <- EXTRATO
        print(extrato(operacoes, saldo))

    
    print(''.center(20, '-'))