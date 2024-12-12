def busqSecTxt(txt: str, sub_txt: str) -> int:
    n: int = len(txt)
    m: int = len(sub_txt)

    for i in range(n - m + 1):
        is_match: bool = True
        for j in range(m):
            if txt[i + j] != sub_txt[j]:
                is_match = False
                break
        if is_match:
            return i

    return -1
