# テスト結果

$ rspec ./spec
```
Card
  notation
    (s) and A
      should be A(s)
    (s) and 1
      should be A(s)
  has_same_suit?
    3(s) and A(s)
      should be true
    A(d) and A(s)
      should be false

HandChecker
  result
    2(h), 1(h), 3(h)
      should be StraightFlushHand class
    2(c), 2(h), 2(d)
      should be ThreeOfAKindHand class
    2(h), 1(c), 3(h)
      should be StraightHand class
    2(h), 1(h), 5(h)
      should be FlushHand class
    2(c), 2(h), 9(d)
      should be PairHand class
    2(c), 12(h), 9(d)
      should be HighCardHand class
  straight?
    rank: 2, 1, 3
      should be true
    rank: 13, 12, 1
      should be true
    rank: 13, 1, 2
      should be false
    rank: 6, 7, 9
      should be false

Hand
  HighCardHand
    compare_cards
      [10(h), 7(h), 1(h)] AND [5(h), 7(h), 1(h)]
        should be -1
    match_cards_notation
      10(h), 7(h), 1(h)
        should be 7(h)|10(h)|A(h)
  PairHand
    compare_cards
      [7(h), 7(h), 1(h)] AND [1(h), 7(h), 1(h)]
        should be 1
      same rank
        [7(h), 7(h), 1(h)] AND [7(h), 13(h), 7(h)]
          should be -1
    match_cards_notation
      should be A(h)|A(s)
  StraightFlushHand
    match_cards_notation
      2(h), 3(h), A(h)
        should be A(h)|2(h)|3(h)
      K(h), A(h), Q(h)
        should be Q(h)|K(h)|A(h)
    compare_cards
      same hand
        [2(h), 3(h), A(h)] AND [K(h), A(h), Q(h)]
          should be 1

Poker
  play
    should has @players count 2
    should sort @players by strength (PENDING: Temporarily skipped with xit)
  display
    should output result

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) Poker play should sort @players by strength
     # Temporarily skipped with xit
     # ./spec/poker_spec.rb:11


Finished in 0.01277 seconds (files took 0.13684 seconds to load)
25 examples, 0 failures, 1 pending
```

