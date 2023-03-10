import React, {Component} from 'react';
import PropTypes from 'prop-types';
import {Form} from 'react-bootstrap';
import InputLabel from "./InputLabel";

export default class TextInput extends Component {

  render() {
    const {
      name,
      label,
      value,
      tooltip,
      handleChange
    } = this.props;

    return (
      <Form.Group controlId={name} title={tooltip}>
        <InputLabel label={label} tooltip={tooltip}/>
        <Form.Control
          className="input-v2"
          required
          name={name}
          type="text"
          onChange={handleChange}
          value={value}
        />
        <Form.Control.Feedback type="invalid">
          {label} is required
        </Form.Control.Feedback>
      </Form.Group>
    )
  }
}

TextInput.propTypes = {
  name: PropTypes.string.isRequired,
  label: PropTypes.string.isRequired,
  tooltip: PropTypes.string,
  handleChange: PropTypes.func.isRequired,
  value: PropTypes.string.isRequired
};
