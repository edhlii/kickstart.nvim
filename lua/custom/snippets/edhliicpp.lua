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
  s('segtree', {
    t {
      'struct SegTree {',
      '  int n;',
      '  vector<int> tree;',
      '',
      '  inline int combine(int a, int b) {',
      '    // TODO: chỉnh sửa hàm combine cho phù hợp (vd: min(a, b), max(a, b), a + b, ...)',
      '    return a + b;',
      '  }',
      '',
      '  SegTree(const vector<int> &arr) {',
      '    n = arr.size();',
      '    tree.resize(n << 1);',
      '    for (int i = 0; i < n; ++i)',
      '      tree[i + n] = arr[i];',
      '    for (int i = n - 1; i > 0; --i)',
      '      tree[i] = combine(tree[i << 1], tree[i << 1 | 1]);',
      '  }',
      '',
      '  inline void update(int pos, int val) {',
      '    pos += n;',
      '    tree[pos] = val;',
      '    for (pos >>= 1; pos; pos >>= 1)',
      '      tree[pos] = combine(tree[pos << 1], tree[pos << 1 | 1]);',
      '  }',
      '',
      '  inline int query(int l, int r) {',
      '    int resL = 0, resR = 0; // TODO: chỉnh phần tử đơn vị phù hợp',
      '    l += n;',
      '    r += n;',
      '    while (l < r) {',
      '      if (l & 1)',
      '        resL = combine(resL, tree[l++]);',
      '      if (r & 1)',
      '        resR = combine(tree[--r], resR);',
      '      l >>= 1;',
      '      r >>= 1;',
      '    }',
      '    return combine(resL, resR);',
      '  }',
      '};',
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
  s(
    'bigint',
    t {
      'const ll BASE = 1000000000;',
      'const int BASE_DIGITS = 9;',
      '',
      '// By edhlii and GPT :>',
      'struct BigInt {',
      '  vector<long long> digits;',
      '  BigInt() {}',
      '  BigInt(long long v) {',
      '    while (v) {',
      '      digits.push_back(v % BASE);',
      '      v /= BASE;',
      '    }',
      '  }',
      '  BigInt(const string &s) { read(s); }',
      '  void read(const string &s) {',
      '    digits.clear();',
      '    int len = s.size();',
      '    for (int i = len; i > 0; i -= BASE_DIGITS) {',
      '      int start = max(0, i - BASE_DIGITS);',
      '      int length = i - start;',
      '      digits.push_back(stoll(s.substr(start, length)));',
      '    }',
      '    trim();',
      '  }',
      '  void trim() {',
      '    while (!digits.empty() && digits.back() == 0)',
      '      digits.pop_back();',
      '  }',
      '  friend ostream &operator<<(ostream &out, const BigInt &a) {',
      '    if (a.digits.empty()) {',
      '      out << 0;',
      '      return out;',
      '    }',
      '    out << a.digits.back();',
      '    for (int i = a.digits.size() - 2; i >= 0; --i)',
      "      out << setw(BASE_DIGITS) << setfill('0') << a.digits[i];",
      '    return out;',
      '  }',
      '  BigInt operator+(const BigInt &other) const {',
      '    BigInt res;',
      '    long long carry = 0;',
      '    size_t n = max(digits.size(), other.digits.size());',
      '    for (size_t i = 0; i < n || carry; ++i) {',
      '      long long sum = carry;',
      '      if (i < digits.size())',
      '        sum += digits[i];',
      '      if (i < other.digits.size())',
      '        sum += other.digits[i];',
      '      res.digits.push_back(sum % BASE);',
      '      carry = sum / BASE;',
      '    }',
      '    return res;',
      '  }',
      '  BigInt operator-(const BigInt &other) const {',
      '    BigInt res = *this;',
      '    long long carry = 0;',
      '    for (size_t i = 0; i < other.digits.size() || carry; ++i) {',
      '      res.digits[i] -= carry + (i < other.digits.size() ? other.digits[i] : 0);',
      '      carry = res.digits[i] < 0;',
      '      if (carry)',
      '        res.digits[i] += BASE;',
      '    }',
      '    res.trim();',
      '    return res;',
      '  }',
      '  BigInt operator*(const BigInt &other) const {',
      '    BigInt res;',
      '    res.digits.resize(digits.size() + other.digits.size());',
      '    for (size_t i = 0; i < digits.size(); i++) {',
      '      long long carry = 0;',
      '      for (size_t j = 0; j < other.digits.size() || carry; j++) {',
      '        long long cur =',
      '            res.digits[i + j] +',
      '            digits[i] * (j < other.digits.size() ? other.digits[j] : 0) + carry;',
      '        res.digits[i + j] = cur % BASE;',
      '        carry = cur / BASE;',
      '      }',
      '    }',
      '    res.trim();',
      '    return res;',
      '  }',
      '  bool operator<(const BigInt &other) const {',
      '    if (digits.size() != other.digits.size())',
      '      return digits.size() < other.digits.size();',
      '    for (int i = digits.size() - 1; i >= 0; i--) {',
      '      if (digits[i] != other.digits[i])',
      '        return digits[i] < other.digits[i];',
      '    }',
      '    return false;',
      '  }',
      '  bool operator<=(const BigInt &other) const { return !(other < *this); }',
      '  pair<BigInt, BigInt> divmod(const BigInt &other) const {',
      '    BigInt quotient, remainder;',
      '    quotient.digits.resize(digits.size());',
      '    for (int i = digits.size() - 1; i >= 0; i--) {',
      '      remainder.digits.insert(remainder.digits.begin(), digits[i]);',
      '      remainder.trim();',
      '      int low = 0, high = BASE - 1, mid, curDigit = 0;',
      '      while (low <= high) {',
      '        mid = (low + high) / 2;',
      '        BigInt t = other * BigInt(mid);',
      '        if (t <= remainder) {',
      '          curDigit = mid;',
      '          low = mid + 1;',
      '        } else {',
      '          high = mid - 1;',
      '        }',
      '      }',
      '      quotient.digits[i] = curDigit;',
      '      remainder = remainder - other * BigInt(curDigit);',
      '    }',
      '    quotient.trim();',
      '    remainder.trim();',
      '    return {quotient, remainder};',
      '  }',
      '  BigInt operator/(const BigInt &other) const { return divmod(other).first; }',
      '  BigInt operator%(const BigInt &other) const { return divmod(other).second; }',
      '  BigInt &operator+=(const BigInt &other) { return *this = *this + other; }',
      '  BigInt &operator-=(const BigInt &other) { return *this = *this - other; }',
      '  BigInt &operator*=(const BigInt &other) { return *this = *this * other; }',
      '  BigInt &operator/=(const BigInt &other) {',
      '    return *this = divmod(other).first;',
      '  }',
      '  BigInt &operator%=(const BigInt &other) {',
      '    return *this = divmod(other).second;',
      '  }',
      '};',
    }
  ),
})
