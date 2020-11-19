module Web.Types where

import IHP.Prelude
import IHP.ModelSupport
import Generated.Types

data WebApplication = WebApplication deriving (Eq, Show)


data StaticController = WelcomeAction | AboutAction deriving (Eq, Show, Data)

data EventsController
    = CreateEventAction
    deriving (Eq, Show, Data)
