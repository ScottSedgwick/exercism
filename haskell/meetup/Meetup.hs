module Meetup(Weekday(..), Schedule(..), meetupDay) where

import Data.Time.Calendar(Day(..), fromGregorian, gregorianMonthLength, addDays)
import Data.Time.Calendar.WeekDate(toWeekDate)

data Weekday = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday deriving (Enum)

data Schedule = First | Second | Third | Fourth | Last | Teenth deriving (Enum)

firstDayOfMonth :: Integer -> Int -> Weekday
firstDayOfMonth y m = toEnum $ dayIdx - 1
  where (_,_,dayIdx) = toWeekDate $ fromGregorian y m 1

daysBetween :: Weekday -> Weekday -> Int
daysBetween from to = if d < 0 then d + 7 else d
  where d = fromEnum to - fromEnum from

getDaysToAdd :: Schedule -> Int -> Int -> Int
getDaysToAdd Last   d m = d + if d + 28 < m then 28 else 21
getDaysToAdd Teenth d _ = d + if d < 5 then 14 else 7
getDaysToAdd sched  d _ = d + 7 * fromEnum sched

meetupDay :: Schedule -> Weekday -> Integer -> Int -> Day
meetupDay schedule weekday year month = addDays daysToAdd firstOfMonth
  where firstOfMonth  = fromGregorian year month 1
        daysToAdd     = toInteger $ getDaysToAdd schedule daysToWeekday daysInMonth
        daysInMonth   = gregorianMonthLength year month
        daysToWeekday = daysBetween startDay weekday
        startDay      = firstDayOfMonth year month