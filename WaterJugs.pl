pourWater([CurrentFirstJug, CurrentSecondJug, CurrentThirdJug], [0, TargetSecondJug, CurrentThirdJug]):- RemainingWaterAmount is (5 - CurrentSecondJug), CurrentFirstJug =< RemainingWaterAmount,
TargetSecondJug is CurrentSecondJug + CurrentFirstJug, TargetSecondJug =< 5, TargetSecondJug \== CurrentSecondJug.

pourWater([CurrentFirstJug, CurrentSecondJug, CurrentThirdJug], [TargetFirstJug, 5, CurrentThirdJug]):- RemainingWaterAmount is (5 - CurrentSecondJug), CurrentFirstJug > RemainingWaterAmount,
TargetFirstJug is CurrentFirstJug - RemainingWaterAmount, TargetFirstJug =< 8, TargetFirstJug \== CurrentFirstJug.

pourWater([CurrentFirstJug, CurrentSecondJug, CurrentThirdJug], [0, CurrentSecondJug, TargetThirdJug]):- RemainingWaterAmount is (3 - CurrentThirdJug), CurrentFirstJug =< RemainingWaterAmount,
TargetThirdJug is CurrentThirdJug + CurrentFirstJug, TargetThirdJug =< 3, TargetThirdJug \== CurrentThirdJug.

pourWater([CurrentFirstJug, CurrentSecondJug, CurrentThirdJug], [TargetFirstJug, CurrentSecondJug, 3]):- RemainingWaterAmount is (3 - CurrentThirdJug), CurrentFirstJug > RemainingWaterAmount,
TargetFirstJug is CurrentFirstJug - RemainingWaterAmount, TargetFirstJug =< 8, TargetFirstJug \== CurrentFirstJug.

pourWater([CurrentFirstJug, CurrentSecondJug, CurrentThirdJug], [TargetFirstJug, 0, CurrentThirdJug]):- RemainingWaterAmount is (8 - CurrentFirstJug), CurrentSecondJug =< RemainingWaterAmount,
TargetFirstJug is CurrentFirstJug + CurrentSecondJug, TargetFirstJug =< 8, TargetFirstJug \== CurrentFirstJug.

pourWater([CurrentFirstJug, CurrentSecondJug, CurrentThirdJug], [8, TargetSecondJug, CurrentThirdJug]):- RemainingWaterAmount is (8 - CurrentFirstJug), CurrentSecondJug > RemainingWaterAmount,
TargetSecondJug is CurrentSecondJug - RemainingWaterAmount, TargetSecondJug =< 5, TargetSecondJug \== CurrentSecondJug.

pourWater([CurrentFirstJug, CurrentSecondJug, CurrentThirdJug], [CurrentFirstJug, 0, TargetThirdJug]):- RemainingWaterAmount is (3 - CurrentThirdJug), CurrentSecondJug =< RemainingWaterAmount,
TargetThirdJug is CurrentThirdJug + CurrentFirstJug, TargetThirdJug =< 3, TargetThirdJug \== CurrentThirdJug.

pourWater([CurrentFirstJug, CurrentSecondJug, CurrentThirdJug], [CurrentFirstJug, TargetSecondJug, 3]):- RemainingWaterAmount is (3 - CurrentThirdJug), CurrentSecondJug > RemainingWaterAmount,
TargetSecondJug is CurrentSecondJug - RemainingWaterAmount, TargetSecondJug =< 5, TargetSecondJug \== CurrentSecondJug.

pourWater([CurrentFirstJug, CurrentSecondJug, CurrentThirdJug], [TargetFirstJug, CurrentSecondJug, 0]):- RemainingWaterAmount is (8 - CurrentFirstJug), CurrentThirdJug =< RemainingWaterAmount,
TargetFirstJug is CurrentFirstJug + CurrentThirdJug, TargetFirstJug =< 8, TargetFirstJug \== CurrentFirstJug.

pourWater([CurrentFirstJug, CurrentSecondJug, CurrentThirdJug], [8, CurrentSecondJug, TargetThirdJug]):- RemainingWaterAmount is (8 - CurrentFirstJug), CurrentThirdJug > RemainingWaterAmount,
TargetThirdJug is CurrentThirdJug - RemainingWaterAmount, TargetThirdJug =< 3, TargetThirdJug \== CurrentThirdJug.

pourWater([CurrentFirstJug, CurrentSecondJug, CurrentThirdJug], [CurrentFirstJug, TargetSecondJug, 0]):- RemainingWaterAmount is (5 - CurrentSecondJug), CurrentThirdJug =< RemainingWaterAmount,
TargetSecondJug is CurrentSecondJug + CurrentThirdJug, TargetSecondJug =< 5, TargetSecondJug \== CurrentSecondJug.

pourWater([CurrentFirstJug, CurrentSecondJug, CurrentThirdJug], [CurrentFirstJug, 5, TargetThirdJug]):- RemainingWaterAmount is (5 - CurrentSecondJug), CurrentThirdJug > RemainingWaterAmount,
TargetThirdJug is CurrentThirdJug - RemainingWaterAmount, TargetThirdJug =< 3, TargetThirdJug \== CurrentThirdJug.

depthFirstSearch(InitialWaterAmounts):- depthFirstSearch(InitialWaterAmounts, [4, _, _], [InitialWaterAmounts]).
depthFirstSearch([4, _, _], _ , WaterAmountsPath):- write(WaterAmountsPath).
depthFirstSearch(CurrentWaterAmounts, TargetWaterAmounts, WaterAmountsPath):- pourWater(CurrentWaterAmounts, NextWaterAmounts),
   not(member(NextWaterAmounts, WaterAmountsPath)),
   append(WaterAmountsPath, [NextWaterAmounts], UpdatedWaterAmounts),
    depthFirstSearch(NextWaterAmounts, TargetWaterAmounts, UpdatedWaterAmounts).
