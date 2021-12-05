import * as React from 'react';
import {useState,useEffect} from 'react';
import Box from '@mui/material/Box';
import TextField from '@mui/material/TextField';
import { Container,Paper } from '@mui/material';
import { margin, width } from '@mui/system';
import { makeStyles } from '@mui/styles';
import Button from '@mui/material/Button';



export default function Contact() {
    const paperstyle={padding:'50px 50px', width:1000,margin:'50px auto'}
    const[firstName, setFirstName]=useState('')
    const[lastName, setLastName]=useState('')
    const[number, setNumber]=useState('')
    const[id, setId]=useState('')
    const[contacts,setContacts]=useState([])
    const handleDeleteClick=(contactid)=>{
      console.log(contactid)
      fetch("http://0.0.0.0:8080/user/delete/"+contactid,{
        method:"DELETE", headers:{"Content-Type":"application/json"},body:JSON.stringify(id)}).then(()=>{
          console.log("The contact has been deleted")
        })
      }
    const handleSubmitClick=(e)=>{
        e.preventDefault()
        const contact={firstName,lastName,number}
        console.log(contact)
        fetch("http://0.0.0.0:8080/user/add",{
            method:"POST",
            headers:{"Content-Type":"application/json"},
            body:JSON.stringify(contact) }).then(()=>{
                console.log("New Contact added")
              })
        }
        const handleEditClick=(e)=>{
          e.preventDefault()
          const editedcontact={id,firstName,lastName,number}
          console.log(editedcontact)
          fetch("http://0.0.0.0:8080/user/edit",{
              method:"PUT",
              headers:{"Content-Type":"application/json"},
              body:JSON.stringify(editedcontact) }).then(()=>{
                  console.log("Contact has been edited")
                })
          }
        useEffect(()=>{
          fetch("http://0.0.0.0:8080/user/list")
          .then(res=>res.json())
          .then((result)=>{
            console.log(result)
            setContacts(result)
            console.log(contacts);
          }
          
          
        )
        },[])
        
  return (
    <Box
      component="form"
      sx={{
        
        // '& > :not(style)': { m: 5, width: '25' },
        p: 2, border: '1px dashed green'
      }}
      noValidate
      autoComplete="off"
    >
         <h1>ADD a new Contact</h1>
        <Container>
            <Paper elevation={3} style={paperstyle} >
    <form align="center" noValidate autoComplete="off">
      <TextField id="standard-basic" label="FirstName" variant="standard" value={firstName} onChange={(e)=>setFirstName(e.target.value)}/>
      <TextField id="standard-basic" label="LastName" variant="standard" value={lastName} onChange={(e)=>setLastName(e.target.value)}/>
      <TextField id="standard-basic" label="Number" variant="standard" value={number} onChange={(e)=>setNumber(e.target.value)}/>
      <Button variant="contained" color="secondary" onClick={handleSubmitClick}>
        Submit
      </Button>
      </form>
      </Paper>
      <h1>EDIT your Contacts</h1>
      </Container>
      <Container>
      <Paper elevation={3} style={paperstyle} >
    <form align="center" noValidate autoComplete="off">
    <TextField id="standard-basic" label="Id" variant="standard" value={id} onChange={(e)=>setId(e.target.value)}/>
      <TextField id="standard-basic" label="FirstName" variant="standard" value={firstName} onChange={(e)=>setFirstName(e.target.value)}/>
      <TextField id="standard-basic" label="LastName" variant="standard" value={lastName} onChange={(e)=>setLastName(e.target.value)}/>
      <TextField id="standard-basic" label="Number" variant="standard" value={number} onChange={(e)=>setNumber(e.target.value)}/>
      <Button variant="contained" color="secondary" onClick={handleEditClick}>
        Submit
      </Button>
      </form>
      </Paper>
        </Container>
        <h1>Your Contacts</h1>
        <Container>

<Paper elevation={4} style={paperstyle}>

  {contacts.map(contact=>(
    <Paper elevation={6} style={{margin:"20px",padding:"30px", textAlign:"Center"}} key={contact.id} action="">
     Id:{contact.id}<br/>
     FirstName:{contact.firstName}<br/>
     LastName:{contact.lastName}<br/>
     Number:{contact.number}<br/>
             




     Options:  {<Button variant="contained" color="secondary" onClick={()=>handleDeleteClick(contact.id)}>Delete</Button>
     }<br/>
     
     
    </Paper>
    
    
  ))
}


</Paper>
      </Container>

      <Container>
      </Container>

    </Box>
  );
}
