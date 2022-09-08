pourWater([CurrentFirstJar, CurrentSecondJar, CurrentThirdJar], [0, TargetSecondJar, CurrentThirdJar]):- RemainingWaterAmount is (5 - CurrentSecondJar), CurrentFirstJar =< RemainingWaterAmount,
TargetSecondJar is CurrentSecondJar + CurrentFirstJar, TargetSecondJar =< 5, TargetSecondJar \== CurrentSecondJar.

pourWater([CurrentFirstJar, CurrentSecondJar, CurrentThirdJar], [TargetFirstJar, 5, CurrentThirdJar]):- RemainingWaterAmount is (5 - CurrentSecondJar), CurrentFirstJar > RemainingWaterAmount,
TargetFirstJar is CurrentFirstJar - RemainingWaterAmount, TargetFirstJar =< 8, TargetFirstJar \== CurrentFirstJar.

pourWater([CurrentFirstJar, CurrentSecondJar, CurrentThirdJar], [0, CurrentSecondJar, TargetThirdJar]):- RemainingWaterAmount is (3 - CurrentThirdJar), CurrentFirstJar =< RemainingWaterAmount,
TargetThirdJar is CurrentThirdJar + CurrentFirstJar, TargetThirdJar =< 3, TargetThirdJar \== CurrentThirdJar.

pourWater([CurrentFirstJar, CurrentSecondJar, CurrentThirdJar], [TargetFirstJar, CurrentSecondJar, 3]):- RemainingWaterAmount is (3 - CurrentThirdJar), CurrentFirstJar > RemainingWaterAmount,
TargetFirstJar is CurrentFirstJar - RemainingWaterAmount, TargetFirstJar =< 8, TargetFirstJar \== CurrentFirstJar.

pourWater([CurrentFirstJar, CurrentSecondJar, CurrentThirdJar], [TargetFirstJar, 0, CurrentThirdJar]):- RemainingWaterAmount is (8 - CurrentFirstJar), CurrentSecondJar =< RemainingWaterAmount,
TargetFirstJar is CurrentFirstJar + CurrentSecondJar, TargetFirstJar =< 8, TargetFirstJar \== CurrentFirstJar.

pourWater([CurrentFirstJar, CurrentSecondJar, CurrentThirdJar], [8, TargetSecondJar, CurrentThirdJar]):- RemainingWaterAmount is (8 - CurrentFirstJar), CurrentSecondJar > RemainingWaterAmount,
TargetSecondJar is CurrentSecondJar - RemainingWaterAmount, TargetSecondJar =< 5, TargetSecondJar \== CurrentSecondJar.

pourWater([CurrentFirstJar, CurrentSecondJar, CurrentThirdJar], [CurrentFirstJar, 0, TargetThirdJar]):- RemainingWaterAmount is (3 - CurrentThirdJar), CurrentSecondJar =< RemainingWaterAmount,
TargetThirdJar is CurrentThirdJar + CurrentFirstJar, TargetThirdJar =< 3, TargetThirdJar \== CurrentThirdJar.

pourWater([CurrentFirstJar, CurrentSecondJar, CurrentThirdJar], [CurrentFirstJar, TargetSecondJar, 3]):- RemainingWaterAmount is (3 - CurrentThirdJar), CurrentSecondJar > RemainingWaterAmount,
TargetSecondJar is CurrentSecondJar - RemainingWaterAmount, TargetSecondJar =< 5, TargetSecondJar \== CurrentSecondJar.

pourWater([CurrentFirstJar, CurrentSecondJar, CurrentThirdJar], [TargetFirstJar, CurrentSecondJar, 0]):- RemainingWaterAmount is (8 - CurrentFirstJar), CurrentThirdJar =< RemainingWaterAmount,
TargetFirstJar is CurrentFirstJar + CurrentThirdJar, TargetFirstJar =< 8, TargetFirstJar \== CurrentFirstJar.

pourWater([CurrentFirstJar, CurrentSecondJar, CurrentThirdJar], [8, CurrentSecondJar, TargetThirdJar]):- RemainingWaterAmount is (8 - CurrentFirstJar), CurrentThirdJar > RemainingWaterAmount,
TargetThirdJar is CurrentThirdJar - RemainingWaterAmount, TargetThirdJar =< 3, TargetThirdJar \== CurrentThirdJar.

pourWater([CurrentFirstJar, CurrentSecondJar, CurrentThirdJar], [CurrentFirstJar, TargetSecondJar, 0]):- RemainingWaterAmount is (5 - CurrentSecondJar), CurrentThirdJar =< RemainingWaterAmount,
TargetSecondJar is CurrentSecondJar + CurrentThirdJar, TargetSecondJar =< 5, TargetSecondJar \== CurrentSecondJar.

pourWater([CurrentFirstJar, CurrentSecondJar, CurrentThirdJar], [CurrentFirstJar, 5, TargetThirdJar]):- RemainingWaterAmount is (5 - CurrentSecondJar), CurrentThirdJar > RemainingWaterAmount,
TargetThirdJar is CurrentThirdJar - RemainingWaterAmount, TargetThirdJar =< 3, TargetThirdJar \== CurrentThirdJar.

depthFirstSearch(InitialWaterAmounts):- depthFirstSearch(InitialWaterAmounts, [4, _, _], [InitialWaterAmounts]).
depthFirstSearch([4, _, _], _ , WaterAmountsPath):- write(WaterAmountsPath).
depthFirstSearch(CurrentWaterAmounts, TargetWaterAmounts, WaterAmountsPath):- pourWater(CurrentWaterAmounts, NextWaterAmounts),
   not(member(NextWaterAmounts, WaterAmountsPath)),
   append(WaterAmountsPath, [NextWaterAmounts], UpdatedWaterAmounts),
    depthFirstSearch(NextWaterAmounts, TargetWaterAmounts, UpdatedWaterAmounts).
