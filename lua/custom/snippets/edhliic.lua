local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node

ls.add_snippets('c', {
  s('ctemplate', {
    t {
      '#include <math.h>',
      '#include <stdio.h>',
      '#include <stdlib.h>',
      '#include <string.h>',
      '#define N 1000006',
      '#define MOD 1000000007',
      'typedef long long ll;',
      'typedef unsigned long long ull;',
      '',
      'void process() {}',
      '',
      'int main() {',
      '  int T;',
      '  scanf("%d", &T);',
      '  while (T--)',
      '    process();',
      '}',
    },
  }),
})
