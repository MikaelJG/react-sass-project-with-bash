
import Navbar from './components/Navbar';
import Content from './components/Content';
import Footer from './components/Footer';
import Button from '@mui/material/Button';
import ButtonGroup from '@mui/material/ButtonGroup';
import FormGroup from '@mui/material/FormGroup';
import Checkbox from '@mui/material/Checkbox';
import FormControlLabel from '@mui/material/FormControlLabel';
import './App.scss';

function App() {
    return (
        <div className='App'>
            <Navbar />
            <Content />
            <Footer />
            <Button variant="contained"
                onClick={() => {
                  alert('clicked');
                }}
              > Hello Julien!</Button>
                  <ButtonGroup variant="contained" aria-label="outlined primary button group">
                    <Button>One</Button>
                    <Button>Two</Button>
                    <Button>Three</Button>
                  </ButtonGroup>

                  <FormGroup>
                    <FormControlLabel control={<Checkbox defaultChecked />} label="Label" />
                    <FormControlLabel disabled control={<Checkbox />} label="Disabled" />
                  </FormGroup>
              </div>

    )
}

export default App;
