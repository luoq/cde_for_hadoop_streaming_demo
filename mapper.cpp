#include <string>
#include <iostream>
#include <sstream>
using namespace std;

int main() {
    string line;
    string value = "1";
    string word;
    while (cin >> line)
    {
        stringstream ss(line);
        while (ss >> word)
            cout << word << "\t" << value << endl;
    }
    return 0;
}
