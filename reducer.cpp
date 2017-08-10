#include <string>
#include <map>
#include <iostream>
using namespace std;
int main() {
    string key;
    string value;
    map<string, int> word2count;
    map<string, int>::iterator it;
    while(cin>>key) {
        cin>>value;
        it = word2count.find(key);
        if(it != word2count.end()) {
            (it->second)++;
        }
        else {
            word2count.insert({key, 1});
        }
    }
    
    for(const auto& x: word2count){
        cout<<x.first<<"\t"<<x.second<<endl;
    }
    return 0;
}
