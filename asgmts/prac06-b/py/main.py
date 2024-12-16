def verifAnagramas(str1: str, str2: str) -> bool:
    cont_str1 = {}
    cont_str2 = {}
    
    for c in str1:
        if c in cont_str1:
            cont_str1[c] += 1
        else:
            cont_str1[c] = 1
    
    for c in str2:
        if c in cont_str2:
            cont_str2[c] += 1
        else:
            cont_str2[c] = 1
    
    return cont_str1 == cont_str2
