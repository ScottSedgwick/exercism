module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

secsInYearOn :: Planet -> Integer
secsInYearOn p = case p of
    Mercury -> 7600543
    Venus   -> 19414149
    Earth   -> 31557600
    Mars    -> 59354032
    Jupiter -> 374355659
    Saturn  -> 929292362
    Uranus  -> 2651370019
    Neptune -> 5200418560

ageOn :: Planet -> Integer -> Float
ageOn p secs = fromIntegral secs / fromIntegral (secsInYearOn p)