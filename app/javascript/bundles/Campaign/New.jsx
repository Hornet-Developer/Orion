import React, { Component, Fragment } from "react";

export default class New extends Component {
  constructor(props) {
    super(props);

    this.state = {
      name: "",
      url: "",
      goal: "",
      kpi: "",
      cpa_goal: "",
      roas_goal: "",
      budget: "",
      geography: "",
      flight_start_date: "",
      flight_end_date: "",
      errors: {
        name: "",
        url: "",
        goal: "",
        kpi: "",
        cpa_goal: "",
        roas_goal: "",
        budget: "",
        geography: "",
        flight_start_date: "",
        flight_end_date: "",
      },
    };
  }

  handleInputChange = (event) => {
    event.preventDefault();

    const { name, value } = event.target;

    let errors = this.state.errors;

    this.setState({ errors, [name]: value });
  };

  showErrorStyles(error) {
    if (error === "") {
      return "form-control";
    } else {
      return "form-control error-field";
    }
  }

  showCampaignForm(formFields) {
    const { errors, ...fields } = formFields;

    return Object.entries(fields).map(([key, value]) => {
      return (
        <div className="col col-6">
          <div className={`form-group ${key}`} key={key}>
            <label key={key}>{`${key.split("_").join(" ")}`}</label>
            <input
              className={this.showErrorStyles(errors[key])}
              name={`${key}`}
              type={`${key}`}
              onChange={this.handleInputChange}
            />
            {errors[key].length > 0 && (
              <span className="error-msg">{errors[key]}</span>
            )}
          </div>
        </div>
      );
    });
  }

  getCategoriesData(provider) {
    // Grab the provider id and call the Audience Cat and the sub cat
    return (
      <div className="col col-6">
        <div className="form-group category">
          <label>Audience Category</label>
          <select className="form-control">
            {categories.map((category) => (
              <option>{`${category.name}`}</option>
            ))}
          </select>
        </div>
      </div>
    );
  }

  getSegmentsData(category) {
    // Grab the audience cat and get the segment
    return (
      <div className="col col-6">
        <div className="form-group segment">
          <label>Audience Segment</label>
          <select className="form-control">
            {segments.map((segment) => (
              <option>{`${segment.name}`}</option>
            ))}
          </select>
        </div>
      </div>
    );
  }

  showAudienceFields(props) {
    const { providers, categories, segments } = props;

    return (
      <Fragment>
        <div className="col col-6">
          <div className="form-group provider">
            <label>Audience Provider</label>
            <select className="form-control">
              {providers.map((provider) => (
                <option>{`${provider.name}`}</option>
              ))}
            </select>
          </div>
        </div>
      </Fragment>
    );
  }

  addMoreCampaignAudience() {
    // Button to add more showAudienceFields
  }

  // Move the campaign audience selection to the next page
  render() {
    return (
      <div className="container-fluid campaigns">
        <div className="row">
          <div className="col col-12">
            <h1 className="h5 mb-4">Create Campaign</h1>
            <div className="card">
              <div className="card-body">
                <div className="row">
                  <div className="col col-12">
                    <p className="light-text">
                      Please enter the details of your new campaign
                    </p>
                  </div>
                </div>
                <form>
                  <div className="row">
                    {this.showCampaignForm(this.state)}
                    {this.showAudienceFields(this.props)}
                    {this.addMoreCampaignAudience()}
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  }
}
