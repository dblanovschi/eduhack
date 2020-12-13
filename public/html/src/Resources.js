import './resources.css';

import React from 'react';
import {Box, Divider, GridList, GridListTile, InputLabel, MenuItem, Select} from "@material-ui/core";

import ROOT from './Constants';

class Resources extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            error: null,
            isLoaded: false,
            items: [],
            grade: 'none',
            subject: 'none'
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
        const {error, isLoaded, items, grade, subject} = this.state;
        if (error) {
            return <div>Eroare: {error.message}</div>;
        } else if (!isLoaded) {
            return <div>Se încarcă...</div>;
        } else {
            let r = items.filter((x) => (grade == 'none' || x.grade == grade) && (subject == 'none' || x.subject == subject))

            let state = () => this.state
            let stateChange = (e) => this.setState((p) => e(p))

            return (
                <div>
                    <Box>
                        <InputLabel id="grade-label-id">Clasa</InputLabel>
                        <Select labelId="grade-label-id" defaultValue={state().grade} id="grade-select-id"
                                onChange={(e) => stateChange((prev) => {
                                    return {
                                        ...prev,
                                        grade: e.target.value
                                    }
                                })}>
                            <MenuItem value="none">Toate</MenuItem>
                            <MenuItem value="9">9</MenuItem>
                            <MenuItem value="10">10</MenuItem>
                            <MenuItem value="11">11</MenuItem>
                            <MenuItem value="12">12</MenuItem>
                        </Select>
                        <Divider/>

                        <InputLabel id="subject-label-id">Materie</InputLabel>
                        <Select labelId="subject-label-id" id="subject-select-id"
                                defaultValue={state().subject}
                                onChange={(e) => stateChange((prev) => {
                                    return {
                                        ...prev,
                                        subject: e.target.value
                                    }
                                })}>
                            <MenuItem value="none">Toate</MenuItem>
                            <MenuItem value="informatica">Informatica</MenuItem>
                        </Select>

                    </Box>
                    <Divider/>
                    {r.length > 0 &&
                    <GridList cols={3} className={"api-list"} cellHeight={320}>
                        {r.map((item) => (
                            <GridListTile key={item.id} className={"resource"}>
                                <Box className={"resource-box"}>
                                    <a className="resource-link"
                                       href={ROOT + "/resource/" + item.id}>{item.name}</a>

                                    {subject == 'none' && <p>{item.subject}</p>}
                                    {grade == 'none' && <p>(Clasa a {item.grade})</p>}

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