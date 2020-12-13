import './App.css';

import Resources from "./Resources";

import {BrowserRouter, Route, Switch} from "react-router-dom";
import Resource from "./Resource";
import AddResourceForm from "./AddResourceForm";

function App() {
    return (
        <BrowserRouter>
            <Switch>
                <div className="App">
                    <Route exact path="/">
                        <Resources/>
                    </Route>
                    <Route exact path="/resource/:id">
                        <Resource/>
                    </Route>
                    <Route exact path="/add-resource">
                        <AddResourceForm/>
                    </Route>
                </div>
            </Switch>
        </BrowserRouter>
    );
}

export default App;
