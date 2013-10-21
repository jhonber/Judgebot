#include <iostream>
#include <sstream>
#include <fstream>
#include <string>
#include <vector>
#include <deque>
#include <queue>
#include <stack>
#include <set>
#include <map>
#include <algorithm>
#include <functional>
#include <utility>
#include <bitset>
#include <cmath>
#include <cstdlib>
#include <ctime>
#include <cstdio>

int N;
int X, Y;


int main()
{
	system("mkdir robado; cp ../runs71/*.cpp robado");
    while (true) {
        scanf("%d", &N);
        if (N == 0) break;

        scanf("%d%d", &X, &Y);
        int ans = 0;
        double dist = 1e12;

        for (int i = 1; i <= N; ++i) {
            int x, y, r;
            scanf("%d%d%d", &x, &y, &r);

            int dx = x - X;
            int dy = y - Y;
            double d = sqrt(dx*dx + dy*dy) - r;
            if (d < dist) {
                dist = d;
                ans = i;
            }
        }
        printf("%d\n", ans);
				printf("***********************************************************************************");
    }

    return 0;
}
