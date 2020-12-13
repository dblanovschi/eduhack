import React from 'react';
import ROOT from "./Constants";
import {useParams} from 'react-router-dom';
import {Divider, GridList, GridListTile} from "@material-ui/core";
import ReactMarkdown from "react-markdown";
import {Prism as SyntaxHighlighter} from 'react-syntax-highlighter'
import {dark} from 'react-syntax-highlighter/dist/esm/styles/prism'
import './Resource.css';

export default function Resource(props) {
    let {id} = useParams();
    return (<ResourceW id={id}/>)
}

class ResourceW extends React.Component {
    constructor(props) {
        super(props);
        let id = props.id;
        this.state = {
            error: null,
            isLoaded: false,
            id: id,
            exercises: [],
            item: {}
        };
    }

    componentDidMount() {
        fetch(ROOT + "/api/resources?id=" + this.state.id)
            .then(res => res.json())
            .then(
                (result) => {
                    fetch(ROOT + "/api/exercises?id=" + this.state.id).then(res => res.json()).then((res) => {
                        this.setState({
                            isLoaded: true,
                            id: this.state.id,
                            exercises: res,
                            item: result,
                        });
                    }, (error) => {
                        this.setState({
                            isLoaded: true,
                            error
                        });
                    });
                },
                (error) => {
                    this.setState({
                        isLoaded: true,
                        error
                    });
                }
            )
    }

    render() {
        const {error, isLoaded, id, exercises, item} = this.state;

        if (error) {
            return <div>Error: {error.message}</div>;
        } else if (!isLoaded) {
            return <div>Loading...</div>;
        } else {
            const renderers = {
                code: ({language, value}) => {
                    return <SyntaxHighlighter style={dark} language={language} children={value} />
                }
            }
            return (
                <div>
                    <h1>{item.name}</h1>
                    <ReactMarkdown className={"resource-markdown"} renderers={renderers} style={dark}>{item.markdown}</ReactMarkdown>

                    <Divider/>

                    {exercises.length > 0 &&
                    <div>
                        <h1>Exercitii</h1>

                        <GridList cols={3} cellHeight={200}>
                            {
                                exercises.map((exercise) =>
                                    <GridListTile>
                                        <h1><a href={exercise.link}>{exercise.name}</a></h1>
                                        <p>Dificultate = {exercise.difficulty_level}</p>
                                    </GridListTile>
                                )
                            }
                        </GridList>
                    </div>
                    }
                </div>
            );
        }
    }
}