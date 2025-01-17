import sys
from antlr4 import *
from SygusLexer import SygusLexer
from SygusParser import SygusParser
from SyGuSToCVisitor import SygusVisitor
import glob, os

# this parser parses a sygus file and reduce it to a verify problem in C

def GRewritter(ex_list,inputStr,ex_out_list):
    if ex_list == []:
        numEx = 1
    else:
        numEx = len(ex_list)
    input = InputStream(inputStr)
    lexer = SygusLexer(input)
    stream = CommonTokenStream(lexer)
    parser = SygusParser(stream)
    tree = parser.cmdPlus()
    v = SygusVisitor()
    v.num_ex = numEx
    v.ex_list = ex_list
    v.source = inputStr
    out =  v.visit(tree)

    result = "\ntypedef _Bool bool;\nextern void __VERIFIER_error (void);\nextern int __VERIFIER_nondet_int();\n"
    for i in range(0, v.num_ex):
        result += "int I_" + str(i) + " = -1;\n"
    result += v.header + "\n"
    result += v.result + "\n"
    result += v.funDef + "\n"
    #result += "bool spec" + v.get_application_spec() + "{\n"
    #result += v.spec+"return 1;\n}\n"
    if(ex_list == []):
            temp_list = []
            for i in range(0,len(v.spec_varlist)):
                temp_list.append("0")
            ex_list.append(temp_list)
    # main 
    result += "int main(){\n"
    for i in range(0,v.num_ex):
        j = 0
        for var in v.varList:
            result += "int " + var + "_" + str(i) + " = "+ex_list[i][j]+";\n"
            j = j+1
        result +="\n"
    result += "Start" + v.get_application() +";\n"
    for i in range(0,v.num_ex):
        result += "bool spec_out_" + str(i) + " = I_" + str(i) + "==" + str(ex_out_list[i]) +";\n"
    result += "(void)(("
    for i in range(0, v.num_ex):
        result += "!spec_out_" + str(i) + "||"
    result = result[0:len(result)-2]+")||(__VERIFIER_error (), 0));\n}"

    sygus_ex = ""
    for line in inputStr.splitlines():
        if(len(line)>1 and line[1]=="c"):
            break
        sygus_ex+=line+"\n"
    sygus_ex += v.sygus_ex +"(check-synth)"

    smt_top = ""
    for line in inputStr.splitlines():
        if(line.find("define-fun")!=-1):
            smt_top += line+"\n"
    
    for i in range(0,len(v.spec_varlist)):
        smt_top += "(declare-fun " + v.spec_varlist[i]+"! () Int)\n"
	smt_top += "(assert (>= "+v.spec_varlist[i] + "! 0))\n"
    smt_spec = "(assert (or "+v.smt_spec+"))\n(check-sat)\n(get-model)"
    
    return [result, sygus_ex,smt_top,smt_spec,len(v.spec_varlist),v.spec_varlist]


# test
if __name__ == '__main__':
    GRewritter([["2","3"],["4","5"]],"(set-logic LIA)\n(define-fun iteB (( b1 Bool ) (b2 Bool ) (b3 Bool )) Bool ( or ( and b1 b2 ) ( and (not b1 ) b3 ) ) )\n(define-fun plus8 ((b1 Int) (b2 Int) (b3 Int) (b4 Int) (b5 Int) (b6 Int) (b7 Int) (b8 Int )) Int (+  ( plus7 b1 b2 b3 b4  b5 b6 b7 ) b8  ))\n(define-fun plus9 ((b1 Int) (b2 Int) (b3 Int) (b4 Int) (b5 Int) (b6 Int) (b7 Int) (b8 Int ) (b9 Int)  ) Int (+  ( plus8 b1 b2 b3 b4 b5 b6 b7 b8 ) b9 ))\n(define-fun plus3 ((b1 Int) (b2 Int) (b3 Int)) Int ( +  ( + b1 b2) b3))(define-fun plus2 ((b1 Int) (b2 Int)) Int ( + b1 b2))\n(synth-fun max3 ( (y1 Int) (y2 Int)  ) Int ((Start Int (0 16 y1 y2  (+ Start Start) (ite B Start Start) ))(B Bool ( (= NT0 NT0) (>= NT0 NT0)))))(declare-var x Int)(declare-var y Int)\n(constraint (>= (max3 x y z) x))(constraint (>= (max3 x y z) y))(constraint (>= (max3 x y z) z))(constraint (or (= x (max3 x y z))(or (= y (max3 x y z))(= z (max3 x y z)))))(check-synth)")
