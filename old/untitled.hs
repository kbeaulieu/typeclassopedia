-- https://hackage.haskell.org/package/base-4.12.0.0/docs/src/Data.Traversable.html#Traversable

class (Functor t, Foldable t) => Traversable t where
  -- Map each element of a structure to an action, evaluate 
  -- these actions from left to right, and collect the results.
  traverse :: Applicative f => (a -> f b) -> t a -> f (t b)
  traverse f = sequenceA . fmap f

  -- Evaluate each action in the structure from left to right, 
  -- and collect the results.
  sequenceA :: Applicative f => t (f a) -> f (t a)
  sequenceA = traverse id

  -- Map each element of a structure to a monadic action, evaluate
  -- these actions from left to right, and collect the results.
  mapM :: Monad m => (a -> m b) -> t a -> m (t b)
  mapM = traverse

  -- Evaluate each monadic action in the structure from left to
  -- right, and collect the results.
  sequence :: Monad m => t (m a) -> m (t a)
  sequence = sequenceA

