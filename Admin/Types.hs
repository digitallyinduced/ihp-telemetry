module Admin.Types where

import IHP.Prelude
import IHP.ModelSupport
import Generated.Types

data AdminApplication = AdminApplication deriving (Eq, Show)


data StaticController = WelcomeAction deriving (Eq, Show, Data)

data EventsController
    = EventsAction
    | NewEventAction
    | ShowEventAction { eventId :: !(Id Event) }
    | CreateEventAction
    | EditEventAction { eventId :: !(Id Event) }
    | UpdateEventAction { eventId :: !(Id Event) }
    | DeleteEventAction { eventId :: !(Id Event) }
    deriving (Eq, Show, Data)
