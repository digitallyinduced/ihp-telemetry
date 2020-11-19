module Web.FrontController where

import IHP.RouterPrelude
import Web.Controller.Prelude
import Web.View.Layout (defaultLayout)

-- Controller Imports
import Web.Controller.Events
import Web.Controller.Static

instance FrontController WebApplication where
    controllers = 
        [ startPage AboutAction
        -- Generator Marker
        , parseRoute @EventsController
        ]

instance InitControllerContext WebApplication where
    initContext = do
        setLayout defaultLayout
