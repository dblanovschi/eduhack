import {Button, Divider, FormControl, Input, InputLabel, TextField} from "@material-ui/core";
import React from 'react';

export default class AddResourceForm extends React.Component {
    render() {
        return (
            <form id="add-resource-form">
                <FormControl>
                    <InputLabel htmlFor="name">Nume</InputLabel>
                    <Input name="name" id="name" form={"add-resource-form"}/>
                </FormControl>

                <Divider />

                <FormControl>
                    <InputLabel htmlFor="md">Markdown</InputLabel>
                    <Input name="md" id="md" multiline={true} form={"add-resource-form"} aria-multiline={true}/>
                </FormControl>

                <Divider/>

                <FormControl>
                    <Button color="primary" fullWidth type="submit" variant="contained">
                        Adauga resursa
                    </Button>
                </FormControl>
            </form>
        )
    }
}