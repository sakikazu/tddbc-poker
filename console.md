# console上での実行
```
[20:24:24 ~/dev/ruby/tddbc/poker master]$ pry                                                                                                                                                                                                    sakikazu@KazutakanoMacBook-
[1] pry(main)> load './src/poker.rb'
=> true

[2] pry(main)> poker = Poker.new(2, 3)
=> #<Poker:0x007fcb812029a8 @deck=#<Deck:0x007fcb81202980>, @play_card_count=3, @players=[#<Player:0x007fcb812028b8 @cards=[], @cd="Player1">, #<Player:0x007fcb81202818 @cards=[], @cd="Player2">]>

[3] pry(main)> poker.play
=> [#<Player:0x007fcb812028b8
  @cards=[#<Card:0x007fcb81242120 @number_index=11, @point_index=10, @rank="Q", @suit="(c)">, #<Card:0x007fcb81238fa8 @number_index=9, @point_index=8, @rank="10", @suit="(d)">, #<Card:0x007fcb81238c88 @number_index=10, @point_index=9, @rank="J", @suit="(d)">],
  @cd="Player1",
  @hand=
   #<StraightHand:0x007fcb812414c8
    @cards=[#<Card:0x007fcb81242120 @number_index=11, @point_index=10, @rank="Q", @suit="(c)">, #<Card:0x007fcb81238fa8 @number_index=9, @point_index=8, @rank="10", @suit="(d)">, #<Card:0x007fcb81238c88 @number_index=10, @point_index=9, @rank="J", @suit="(d)">]>>,
 #<Player:0x007fcb81202818
  @cards=[#<Card:0x007fcb8123a268 @number_index=3, @point_index=2, @rank="4", @suit="(d)">, #<Card:0x007fcb812322e8 @number_index=8, @point_index=7, @rank="9", @suit="(h)">, #<Card:0x007fcb81242440 @number_index=10, @point_index=9, @rank="J", @suit="(c)">],
  @cd="Player2",
  @hand=
   #<HighCardHand:0x007fcb81240c80
    @cards=[#<Card:0x007fcb8123a268 @number_index=3, @point_index=2, @rank="4", @suit="(d)">, #<Card:0x007fcb812322e8 @number_index=8, @point_index=7, @rank="9", @suit="(h)">, #<Card:0x007fcb81242440 @number_index=10, @point_index=9, @rank="J", @suit="(c)">]>>]

[4] pry(main)> poker.display
ランキング
Player1:ストレート[10(d)|J(d)|Q(c)]
Player2:ハイカード[4(d)|9(h)|J(c)]

[5] pry(main)> poker.players
=> [#<Player:0x007fcb812028b8
  @cards=[#<Card:0x007fcb81242120 @number_index=11, @point_index=10, @rank="Q", @suit="(c)">, #<Card:0x007fcb81238fa8 @number_index=9, @point_index=8, @rank="10", @suit="(d)">, #<Card:0x007fcb81238c88 @number_index=10, @point_index=9, @rank="J", @suit="(d)">],
  @cd="Player1",
  @hand=
   #<StraightHand:0x007fcb812414c8
    @cards=[#<Card:0x007fcb81242120 @number_index=11, @point_index=10, @rank="Q", @suit="(c)">, #<Card:0x007fcb81238fa8 @number_index=9, @point_index=8, @rank="10", @suit="(d)">, #<Card:0x007fcb81238c88 @number_index=10, @point_index=9, @rank="J", @suit="(d)">]>>,
 #<Player:0x007fcb81202818
  @cards=[#<Card:0x007fcb8123a268 @number_index=3, @point_index=2, @rank="4", @suit="(d)">, #<Card:0x007fcb812322e8 @number_index=8, @point_index=7, @rank="9", @suit="(h)">, #<Card:0x007fcb81242440 @number_index=10, @point_index=9, @rank="J", @suit="(c)">],
  @cd="Player2",
  @hand=
   #<HighCardHand:0x007fcb81240c80
    @cards=[#<Card:0x007fcb8123a268 @number_index=3, @point_index=2, @rank="4", @suit="(d)">, #<Card:0x007fcb812322e8 @number_index=8, @point_index=7, @rank="9", @suit="(h)">, #<Card:0x007fcb81242440 @number_index=10, @point_index=9, @rank="J", @suit="(c)">]>>]

[6] pry(main)> poker.deck
=> #<Deck:0x007fcb81202980
 @cards=
  [#<Card:0x007fcb81242760 @number_index=9, @point_index=8, @rank="10", @suit="(c)">,
   #<Card:0x007fcb8123a588 @number_index=2, @point_index=1, @rank="3", @suit="(d)">,
   #<Card:0x007fcb81232c48 @number_index=5, @point_index=4, @rank="6", @suit="(h)">,
   #<Card:0x007fcb81230088 @number_index=6, @point_index=5, @rank="7", @suit="(s)">,
   #<Card:0x007fcb81243d40 @number_index=2, @point_index=1, @rank="3", @suit="(c)">,
   #<Card:0x007fcb81231988 @number_index=11, @point_index=10, @rank="Q", @suit="(h)">,
   #<Card:0x007fcb81232608 @number_index=7, @point_index=6, @rank="8", @suit="(h)">,
   #<Card:0x007fcb81243700 @number_index=4, @point_index=3, @rank="5", @suit="(c)">,
   #<Card:0x007fcb81233c10 @number_index=0, @point_index=12, @rank="A", @suit="(h)">,
   #<Card:0x007fcb81239f48 @number_index=4, @point_index=3, @rank="5", @suit="(d)">,
   #<Card:0x007fcb8123bb68 @number_index=8, @point_index=7, @rank="9", @suit="(s)">,
   #<Card:0x007fcb812392c8 @number_index=8, @point_index=7, @rank="9", @suit="(d)">,
   #<Card:0x007fcb81242da0 @number_index=7, @point_index=6, @rank="8", @suit="(c)">,
   #<Card:0x007fcb81239908 @number_index=6, @point_index=5, @rank="7", @suit="(d)">,
   #<Card:0x007fcb812335a8 @number_index=2, @point_index=1, @rank="3", @suit="(h)">,
   #<Card:0x007fcb81238008 @number_index=1, @point_index=0, @rank="2", @suit="(c)">,
   #<Card:0x007fcb81231fc8 @number_index=9, @point_index=8, @rank="10", @suit="(h)">,
   #<Card:0x007fcb8123a8a8 @number_index=1, @point_index=0, @rank="2", @suit="(d)">,
   #<Card:0x007fcb812309e8 @number_index=3, @point_index=2, @rank="4", @suit="(s)">,
   #<Card:0x007fcb8123aee8 @number_index=12, @point_index=11, @rank="K", @suit="(s)">,
   #<Card:0x007fcb81230d08 @number_index=2, @point_index=1, @rank="3", @suit="(s)">,
   #<Card:0x007fcb81232f68 @number_index=4, @point_index=3, @rank="5", @suit="(h)">,
   #<Card:0x007fcb81241e00 @number_index=12, @point_index=11, @rank="K", @suit="(c)">,
   #<Card:0x007fcb81238328 @number_index=0, @point_index=12, @rank="A", @suit="(c)">,
   #<Card:0x007fcb81231348 @number_index=0, @point_index=12, @rank="A", @suit="(s)">,
   #<Card:0x007fcb81243a20 @number_index=3, @point_index=2, @rank="4", @suit="(c)">,
   #<Card:0x007fcb81238968 @number_index=11, @point_index=10, @rank="Q", @suit="(d)">,
   #<Card:0x007fcb812306c8 @number_index=4, @point_index=3, @rank="5", @suit="(s)">,
   #<Card:0x007fcb812338c8 @number_index=1, @point_index=0, @rank="2", @suit="(h)">,
   #<Card:0x007fcb812433e0 @number_index=5, @point_index=4, @rank="6", @suit="(c)">,
   #<Card:0x007fcb81232928 @number_index=6, @point_index=5, @rank="7", @suit="(h)">,
   #<Card:0x007fcb81231ca8 @number_index=10, @point_index=9, @rank="J", @suit="(h)">,
   #<Card:0x007fcb812395e8 @number_index=7, @point_index=6, @rank="8", @suit="(d)">,
   #<Card:0x007fcb81231668 @number_index=12, @point_index=11, @rank="K", @suit="(h)">,
   #<Card:0x007fcb8123be88 @number_index=7, @point_index=6, @rank="8", @suit="(s)">,
   #<Card:0x007fcb8123b848 @number_index=9, @point_index=8, @rank="10", @suit="(s)">,
   #<Card:0x007fcb8123b208 @number_index=11, @point_index=10, @rank="Q", @suit="(s)">,
   #<Card:0x007fcb81231028 @number_index=1, @point_index=0, @rank="2", @suit="(s)">,
   #<Card:0x007fcb812303a8 @number_index=5, @point_index=4, @rank="6", @suit="(s)">,
   #<Card:0x007fcb81239c28 @number_index=5, @point_index=4, @rank="6", @suit="(d)">,
   #<Card:0x007fcb8123b528 @number_index=10, @point_index=9, @rank="J", @suit="(s)">,
   #<Card:0x007fcb812430c0 @number_index=6, @point_index=5, @rank="7", @suit="(c)">,
   #<Card:0x007fcb81233288 @number_index=3, @point_index=2, @rank="4", @suit="(h)">,
   #<Card:0x007fcb81238648 @number_index=12, @point_index=11, @rank="K", @suit="(d)">,
   #<Card:0x007fcb8123abc8 @number_index=0, @point_index=12, @rank="A", @suit="(d)">,
   #<Card:0x007fcb81242a80 @number_index=8, @point_index=7, @rank="9", @suit="(c)">]>
```
