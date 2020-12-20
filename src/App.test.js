import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';
import { shallow } from 'enzyme';
import Title from './Title';

const title = 'Test Title';
let wrapped = shallow(<Title>{`Title: ${title}`}</Title>);
describe('Title', () => {
  it('should render the Title Component correctly', () => {   
    expect(wrapped).toMatchSnapshot();
  });
  it('renders the Titles children', () => { 
    expect(wrapped.find('h1').text()).toEqual(title);
  });
});

it('renders without crashing', () => {
  const div = document.createElement('div');
  ReactDOM.render(<App />, div);
});
