//Code sending by tester_bo.rb

#include <cmath>
#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

#define rep(i,a,b) for(int i=a;i<b;i++)
#define REP(i,n) rep(i,0,n)
#define repd(i,a,b) for(int i=b-1;i>=a;i--)
#define REPD(i,n) repd(i,0,n)
#define mp make_pair
#define pb push_back

typedef pair<int,int> pii;
typedef vector<pii> vpii;

int main(){
  int n;
  while(cin >> n){
    if(n == 0) break;
    for(int i=0;i<10000000*2;i++);

    vpii entradas;
    vector<pair<double,int> > v;

    for(int i=0; i < n; i++){
      int x, y;
      cin >> x >> y;
      entradas.pb(mp(x,y));
      double d = y * log(x);
      v.pb(mp(d,i));    
    }

    sort(v.begin(), v.end(), greater<pair<double,int> >());
    int index = v[0].second;
    cout << entradas[index].first << " " << entradas[index].second << endl;
  }
  return 0;
}
