
import Navbar from './components/Navbar';
import Content from './components/Content';
import Footer from './components/Footer';
import Button from '@mui/material/Button';
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
        </div>
    )
}

export default App;
