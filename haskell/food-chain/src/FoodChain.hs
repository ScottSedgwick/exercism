module FoodChain (song) where

import Data.Bits

song :: String       
song = map (toEnum . snd) $ d [last b]

a :: (Enum t, Enum t1, Enum t2) => t2 -> t1 -> t -> (Int, Int)
a x y z = (shift f (-9), f .&. 511)
  where 
    f = shift (g x) 12 .|. shift (g y) 6 .|. g z
    g v = fromEnum v - 48

b :: [(Int, Int)]
b = reverse $ f e []
  where 
     f (v:x:y:z) xs = f z (a v x y:xs)
     f _         xs = xs 

c :: Eq a => [a] -> a -> a -> a -> [a]
c (w:ws) x y z = (if w == x then [y,z] else [w]) ++ (c ws x y z)
c _      _ _ _ = []

d :: [(Int, Int)] -> [(Int, Int)]
d x = if null g then x else d $ c x f (b !! fst f) (b !! snd f)
  where 
    f = head g
    g = dropWhile ((0==).fst) x

e :: String
e = "00001900P01[01^01_01g01Q01\\01T01i01X01c01U01V00^00:00W01d01@01b01`01Y01W01Z01S01C01R01801e00Q0\
\1]00\\01G01:1H=0@B4H20X61X94PU1080hB58V1P65P75X[5`W1h@0@70X238Z4X_6PX4Pb6`c6hI70;78X6843@e0@61XD2\
\`910W0@960l0PV0I30A40@<7X;1821`898:80k7hn2i;2i=2a>2Y<2P96823HF:IA1Q@8856010@50h9;8:;A7;Hb;P_;08;a\
\8;h8<1M:iF<@4<HA<PB<Y58Xk<iQ4HA1X`09X=@@=Q[=8Y=a1=hF>1]<a7>@:>I6>Pe>Y:>`?>h2?0C?8n?@;?H7?PE?X<?a6\
\?ia9B04P;4HD2`40B3@Y2@aE@hjA21@P<A@oAH=AR9@@Z9i8AhHB1?B89B@TBHFBPIBX3Ba0Bh2C2=7XDCBI3`@0XZ0XGCPlC\
\IB:Z>:PjDBQ2jM1:NDJP:Q27BW6JXE:VDXjEHcEQ2EZZ6`^38VEiBDY2FB^DPjFRc:`G6:f2P<G1ZG8JGAYGH<GQ1GX=GaIGh\
\PH1HH8>H@2HHIHP5HXMHbhHh=I2LFjOIB^IJTIP`IXRI`MIh<J0BJ9HJ@EJH=JP4JXWJb5Jj2K0DK:MK@kKI8KP_KYBKbTKjO\
\L2eL:`LAVLH2LP;LXVLa6LhdM1BM:`MBOMJ`MPjMZTMa2MjeN0;N85NC9Fh`NPQNX;N`ZNiBO0;O:NO@POJ_OScF9DObOOjVP\
\0cP9GP@OPH7PPGPZ4P`=Pj>Q0PQ:aQ@cQJOQRYQZSQbKQkmD1DR8`R@LRHVRPaRXKR`<RhMS1AS<@@8aSI6SQ@SYGS`BSlJ=I\
\BT<P"