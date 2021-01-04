module Admin.Types where

import IHP.Prelude
import IHP.ModelSupport
import Generated.Types

data AdminApplication = AdminApplication deriving (Eq, Show)


data StaticController = WelcomeAction deriving (Eq, Show, Data)

data EventsController
    = EventsAction
    deriving (Eq, Show, Data)
