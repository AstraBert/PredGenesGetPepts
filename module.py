class AugustusResultFile:
    def __init__(self, path):
        self.path=path
    def find_protein(self):
        with open(self.path) as gff3:
            lines=gff3.readlines()
            for i in range(len(lines)):
                if lines[i].startswith("# protein sequence = "):
                    if "]" in lines[i]:
                        seq = lines[i].split("=")[1].split("[")[1].split("]")[0]
                        return seq
                    else:
                        tojoin=[]
                        tojoin.append(lines[i].split("=")[1].split("[")[1].replace("\n",""))
                        j=i+1
                        while j<len(lines) and not "]" in lines[j-1]:
                            if "]" in lines[j]:
                                tojoin.append(lines[j].split("# ")[1].split("]")[0].replace("\n",""))
                                break
                            else:
                                tojoin.append(lines[j].split("# ")[1].replace("\n",""))
                                j+=1
                            
                        
                        return "".join(tojoin)
                else:
                    pass
    
