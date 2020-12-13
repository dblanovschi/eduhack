import './resources.css';

import React from 'react';
import {Box, Divider, GridList, GridListTile} from "@material-ui/core";

import ROOT from './Constants';

class Resources extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            error: null,
            isLoaded: false,
            items: []
        };
    }

    componentDidMount() {
        fetch(ROOT + "/api/resources")
            .then(res => res.json())
            .then(
                (result) => {
                    this.setState({
                        isLoaded: true,
                        items: result
                    });
                },
                (error) => {
                    this.setState({
                        isLoaded: true,
                        error,
                    });
                }
            )
    }

    render() {
        const {error, isLoaded, items} = this.state;
        if (error) {
            return <div>Error: {error.message}</div>;
        } else if (!isLoaded) {
            return <div>Loading...</div>;
        } else {
            return (
                <div>
                    <h1>Nota 10</h1>
                    <Divider/>
                    {items.length > 0 &&
                    <GridList cols={3} className={"api-list"} cellHeight={320}>
                        {items.map((item) => (
                            <GridListTile key={item.id} className={"resource"}>
                                <Box className={"resource-box"}>
                                    <a className="resource-link"
                                       href={ROOT + "/resource/" + item.id}>{item.name}</a>

                                    <p>{item.subject}</p>

                                    <p className="resource-description">{item.description}</p>
                                </Box>
                            </GridListTile>
                        ))}
                    </GridList>
                    }
                </div>
            );
        }
    }
}

export default Resources;