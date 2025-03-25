-- print 'Custom C++ snippets loaded!'

local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node

ls.add_snippets('cpp', {
  s('cpptemplate', {
    t {
      '#include <bits/stdc++.h>',
      '#define fi first',
      '#define se second',
      'using namespace std;',
      'typedef long long ll;',
      'typedef unsigned long long ull;',
      'const int N = 1000006;',
      'const ll MOD = 1000000007;',
      '',
      'int main() {',
      '  ios_base::sync_with_stdio(false);',
      '  cin.tie(0);',
      '  cout.tie(0);',
      '',
      '  cout << "edhlii\\n";',
      '}',
    },
  }),
  s('binpow', {
    t {
      'll binpow(ll a, ll b, ll c) {',
      '  ll res = 1;',
      '  while (b != 0) {',
      '    if (b & 1) {',
      '      res = (res * a) % c;',
      '    }',
      '    b = b >> 1;',
      '    a = (a * a) % c;',
      '  }',
      '  return res;',
      '}',
    },
  }),
})
