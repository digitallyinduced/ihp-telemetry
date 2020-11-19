module Web.Controller.Static where
import Web.Controller.Prelude
import Web.View.Static.Welcome
import Web.View.Static.About

instance Controller StaticController where
    action AboutAction = render AboutView
    action WelcomeAction = render WelcomeView
