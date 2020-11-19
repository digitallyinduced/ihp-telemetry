module Web.Controller.Events where

import Web.Controller.Prelude

instance Controller EventsController where
    action CreateEventAction = do
        let event = newRecord @Event
        event
            |> fill @["ihpVersion", "os", "arch", "projectId"]
            |> validateField #ihpVersion nonEmpty
            |> validateField #os nonEmpty
            |> validateField #arch nonEmpty
            |> validateField #projectId nonEmpty
            |> ifValid \case
                Left event -> renderPlain "Failed"
                Right event -> do
                    event <- event |> createRecord
                    renderPlain ""

