
--1) DONE, both work
--test cases:
{--myremoveduplicates "abacad" => "bcad"
myremoveduplicates [3,2,1,3,2,2,1,1] => [3,2,1]
--}
myremoveduplicates :: Eq a => [a] -> [a]
myremoveduplicates [] = []
myremoveduplicates list --function name and inputs
   | null list = []   --If the list is empty, return an empty list.
   | elem (head list) (tail list) = myremoveduplicates (tail list) --If the head is a duplicate, remove it and continue.
   | otherwise = (head list) : myremoveduplicates (tail list) --If not a duplicate, keep it and continue.

myremoveduplicates_pm :: Eq a => [a] -> [a]
myremoveduplicates_pm [] = []  -- Base case: an empty list has no duplicates.
myremoveduplicates_pm (x:xs)
  | x `elem` xs = myremoveduplicates_pm xs  -- If the element is a duplicate, skip it.
  | otherwise = x : myremoveduplicates_pm xs  -- If not a duplicate, include it in the result and continue processing the rest of the list.

--2) DONE, both work

{-test cases:
myintersection "abc" "bcd" => "bc"
myintersection [3,4,2,1] [5,4,1,6,2] => [4,2,1]
myintersection [] [1,2,3] => []
myintersection "abc" "" => ""
--}
myintersection :: Eq a => [a] -> [a] -> [a]
myintersection list1 list2
  | null list1 || null list2 = []  -- If either list is empty, return an empty list.
  | elem (head list1) list2 = head list1 : myintersection (tail list1) list2 --if the head of list1, is in list 2, then return the element plus the rest of the operation executed
  | otherwise = myintersection (tail list1) list2

myintersection_pm [] _ = [] -- Base case 1 if the second input is empty, retun empty
myintersection_pm _[] = [] -- Base case 2, if the first input is empty, return null
myintersection_pm (x:xs) list2  --we are at x (the head of the first list), and we want to check if it is in list2 (the second list)
  | x `elem` list2 = x : myintersection_pm xs list2  -- If x is in list2, then include it to the result by doing(x : ), which adds it to the result. X is the head of list 1
  | otherwise = myintersection_pm xs list2 --else if x is not in list2, skip x

--3) DONE, both work
--test cases:
{--{mynthtail 0 "abcd" => "abcd"
mynthtail 1 "abcd" => "bcd"
mynthtail 2 "abcd" => "cd"
mynthtail 3 "abcd" => "d"
mynthtail 4 "abcd" => ""
mynthtail 2 [1, 2, 3, 4] => [3,4]
mynthtail 4 [1, 2, 3, 4] => []} --}

mynthtail :: Int -> [a] -> [a]
mynthtail num list1
  | num <= 0 = list1               -- if num is 0 or negative, return the entire list
  | num >= length list1 = []       -- if num is greater than or equal to the length, return an empty list
  | null list1 = list1             -- base case: return the list when num is 0 or when the list is empty
  | otherwise = mynthtail (num - 1) (tail list1)  -- num is positive, continue dropping elements

mynthtail_pm :: Int -> [a] -> [a]
mynthtail_pm 0 list1 = list1 -- if the number is 0, return list1
mynthtail_pm num [] = [] -- if the list is empty, return an empty list
mynthtail_pm num list1 = mynthtail_pm (num - 1) (tail list1)

--4)DONE, both work
--tets cases:
{--mylast "" => ""
mylast "b" => "b"
mylast "abcd" => "d"
mylast [1, 2, 3, 4] => [4]
mylast [] => []
--}
mylast:: Eq a => [a] -> [a]
mylast list1
  | null list1 = [] --if the list is empty return empty
  | length list1 == 1 = list1 --if the length is 1, return the list
  | otherwise = mylast (tail list1)  -- else, recursively call mylast with the tail of the list

mylast_pm:: Eq a => [a]->[a]
mylast_pm [] = [] --if null, return null
mylast_pm [x] = [x] --if length is 1, retunrn the list
mylast_pm (_:xs) = mylast_pm xs -- Discard the first element and recursively call mylast_pm with the rest of the list

--5) DONE, both work

--theres a simple but not the most efficient way to solve this problem, the one that doesn't use the ++ operator is the most efficient
{--myreverse "" => ""
myreverse "abc" => "cba"
myreverse [1, 2, 3] => [3, 2, 1]
myreverse [] => []
--}

myreverse :: Eq a => [a] -> [a]
myreverse list1
  | null list1 = [] -- If the list is empty, return an empty list
  | null (tail list1) = list1 -- If there's only one element, return the original list
  | otherwise = reverseHelper list1 [] -- Otherwise, call the helper function

reverseHelper :: Eq a => [a] -> [a] -> [a]
reverseHelper original reversed
  | null original = reversed -- When the original list is empty, the reversed list is complete
  | otherwise = reverseHelper (tail original) (head original : reversed) -- Add the head of the original list to the beginning of the reversed list and continue

myreverse_pm :: Eq a => [a] -> [a]
myreverse_pm list1
  | null list1 = []              -- If the list is empty, return an empty list
  | otherwise = reverseTail list1 []

reverseTail :: Eq a => [a] -> [a] -> [a]
reverseTail [] acc = acc         -- When the original list is empty, return the accumulator
reverseTail (x:xs) acc = reverseTail xs (x:acc)  -- Reverse the rest of the list and cons the current element to the accumulator

--6) BOTH DONE
--test cases:
{--myreplaceall 3 7 [7,0,7,1,7,2,7] => [3,0,3,1,3,2,3]
myreplaceall 'x' 'a' "" => ""
myreplaceall 'x' 'a' "abacad" => "xbxcxd"}
--} 
myreplaceall :: Eq a => a -> a -> [a] -> [a]
myreplaceall _ _ [] = []
myreplaceall one two list
  | null list = []
  | head list == two = one : myreplaceall one two (tail list)
  | otherwise = head list : myreplaceall one two (tail list)

myreplaceall_pm :: Eq a => a -> a -> [a] -> [a]
myreplaceall_pm _ _ [] = []  -- If the list is empty, return an empty list.
myreplaceall_pm one two (x:xs)
  | x == two = one : myreplaceall_pm one two xs -- If the current element equals 'two', replace it with 'one'
  | otherwise = x : myreplaceall_pm one two xs -- Otherwise, keep the current element and continue


--7) DONE BOTH WORK
--tets cases:
{--
myordered [] => True
myordered [1] => True
myordered [1,2] => True
myordered [1,1] => True
myordered [2,1] => False
myordered "abcdefg" => True
myordered "ba" => False
--}
myordered :: Ord a => [a] -> Bool
myordered list
  | null list = True
  | null (tail list) = True
  | otherwise = head list <= head (tail list) && myordered (tail list)

myordered_pm :: Ord a => [a] -> Bool
myordered_pm [] = True -- if list is empty, return true
myordered_pm [_] = True --if list only has one element, return true
myordered_pm (x:y:xs) -- first element, second element and the rest of the list
  | x <= y = myordered_pm (y:xs)  -- if first element is less than or equal to second, check the rest of list by recursively calling
  | otherwise = False --If the first element is greater than the second element,list is not ordered

--8)
--test cases: same logic as previous java assignment:
--computeFees “179250;Rick;Reichardt;53;14;Y;E;G;N” => 3450
--computeFees “498545;William;Clinton;68;3;N;S” => 100
--computeFees “412405;Keith;Utley;18;13;Y;S;G;Y;3500” => 0

data Student = DegreeSeeking Int String String (Maybe Double)
             | Certificate Int String
             | Senior Int

--check inputs and decide what type of student to examine, senipr, certificate and degree seeking
parseInput :: String -> Student
parseInput line =
  let words = splitString line
      studentType = words !! 5
      credits = read (words !! 4) :: Int
      parseDegreeSeeking = DegreeSeeking credits (words !! 6) (words !! 7)
      parseCertificate = Certificate credits (words !! 6)
  in case studentType of
        "Y" -> if last words == "N" --Y denotes "Yes, this student is a degree-seeking
               then parseDegreeSeeking Nothing
               else parseDegreeSeeking (Just (read $ last words))
        "N" -> case (words !! 6) of --N denotes "No, this is not a degree-seeking student
                "C" -> parseCertificate
                "S" -> Senior credits
                _   -> error "Invalid non-degree-seeking student type"
        _   -> error "Invalid student type"


--function to split up the input string, for example: 046352;Moe;Howard;32;11;Y;E;G;Y;500.0
-- into a list of strings, so it splits up the inputs into its each individual strings
wordsWhen :: (Char -> Bool) -> String -> [String]
wordsWhen p s =
  case dropWhile p s of
    "" -> []
    s' -> w : wordsWhen p s''
          where
            (w, s'') = break p s'

splitString :: String -> [String]
splitString = wordsWhen (== ';') 

computeFees :: String -> Int -- set the type of student to the correct student fee
computeFees line =
  let student = parseInput line
  in case student of
        DegreeSeeking credits major standing finAid -> calcDegreeFees credits finAid -- degree seeking case
        Certificate credits certType -> calcCertFees credits -- certificate case
        Senior credits -> calcSeniorFees credits -- senior case

{--Degree-seeking student without financial assistance: 
Fees are a recreation and athletics fee of $100, 
a student union fee of $50, and $275 per credit hour, 
up to a maximum of twelve credit hours. --}

calcDegreeFees :: Int -> Maybe Double -> Int
calcDegreeFees credits finAid =
  let maxCredits = 12 -- 12 hr max credit
      cappedCredits = min credits maxCredits --- check credit to see if we reach the 12 max cap
      fees = fromIntegral (100 + 50 + cappedCredits * 275) -- set the total amount of standard fees
      aidAmount = round $ maybe 0 id finAid
  in max 0 (fees - aidAmount)

--for certificate students: Certificate student: fees are a fixed assessment of $700 per term 
--plus $300 for every credit hour the student has enrolled in this term.
calcCertFees :: Int -> Int
calcCertFees credits = 700 + credits * 300 -- fees for certificate students

--senior fees are a fixed assesment of $100 per term for six or fewer credit hours. 
--add an extra $50  for every credit hour greater than six.
calcSeniorFees :: Int -> Int
calcSeniorFees credits
  | credits <= 6 = 100 --if credits are less than 6 or fewer, set the fixed assesment of 100
  | otherwise = 100 + (credits - 6) * 50 --if its greater than 6, add the 100 plus the 50 per credit hour
