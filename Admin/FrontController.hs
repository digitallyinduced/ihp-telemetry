module Admin.FrontController where

import IHP.RouterPrelude
import Admin.Controller.Prelude
import Admin.View.Layout (defaultLayout)

-- Controller Imports
import Admin.Controller.Events
import Admin.Controller.Static

instance FrontController AdminApplication where
    controllers = 
        [ startPage WelcomeAction
        -- Generator Marker
        , parseRoute @EventsController
        ]

instance InitControllerContext AdminApplication where
    initContext = do
        setLayout defaultLayout
