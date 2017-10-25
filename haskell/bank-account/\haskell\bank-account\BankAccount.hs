module BankAccount ( 
	BankAccount 
	,openAccount
	,closeAccount
	,getBalance
	,incrementBalance
	--,putMaybe
) where

import Control.Concurrent
import Control.Monad

type BankAccount = MVar (Maybe Int)

openAccount :: IO(BankAccount)
openAccount = do
	acct <- newMVar $ Just 0
	return acct

closeAccount :: BankAccount -> IO()
closeAccount acct = do
	swapMVar acct Nothing
	return ()

getBalance :: BankAccount -> IO(Maybe Int)
getBalance acct = do
	balance <- tryReadMVar acct
	return $ join balance

incrementBalance :: BankAccount -> Int -> IO(Maybe Int)
incrementBalance acct inc = do
	balance <- getBalance acct
	putMaybe acct $ liftM ((+) inc) balance

putMaybe :: BankAccount -> Maybe Int -> IO(Maybe Int)
putMaybe _    Nothing  = return Nothing
putMaybe acct newBal   = do
	swapMVar acct newBal
	return newBal