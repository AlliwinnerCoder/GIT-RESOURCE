#include <iostream>
#include <fstream>
/*#include <cstring>*/
#include <string>
#include <set>
 
using namespace std;
 
set<string> fileNameSet;
void ProcessFile(const char* FileName)
{
	ifstream fin;
	fin.open(FileName);
	if (!fin) {
		cerr<<"error:unable to open input file:"
		<<FileName<<endl;
		return;
	}
 
 	fileNameSet.insert(FileName);
	cout<<FileName<<endl;
	char str[50];
	while (!fin.eof()) {
		fin.getline(str,50);
		string strLine = str;
		string constStr("#include ");
		if (strLine.find(constStr)==strLine.npos)
			break;
		else {
			string fname = strLine.substr(constStr.length()+1,
				strLine.length()-constStr.length()-2);
			if (fileNameSet.count(fname)==0)
 				ProcessFile(fname.c_str());
			else {
				cerr<<"Self-referential includes is detected:"
					<<fname<<endl;
				return;
			}
		}
	}
	fin.close();
 
}
 
int main(int argc, char **argv)
{
	ProcessFile("A.txt");
	system("pause");
	return 0;
}
