import os

class FileSystem:
    def __init__(self):
        pass
    def makedir_orchange(path):
        """Returns the base directory, the base name (without extension) and the base directory of the base directory"""
        try:
            os.mkdir(path)
            return path
        except FileExistsError:
            return path
    def get_base_dir(path):
        """Returns the base directory, the base name (without extension) and the base directory of the base directory"""
        base, ext= os.path.splitext(path)
        asedir = base.split("/")
        b = "/"
        basedir = b.join(asedir[:len(asedir)-1])
        base_basedir = b.join(asedir[:len(asedir)-2])
        basename = asedir[len(asedir)-1]
        return basedir, basename, base_basedir

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
    
