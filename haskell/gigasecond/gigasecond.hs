module Gigasecond (fromDay) where

import Data.Time.Calendar (Day, addDays)

gigaSecondInDays :: Integer
gigaSecondInDays = 11574

fromDay :: Day -> Day
fromDay = addDays gigaSecondInDays