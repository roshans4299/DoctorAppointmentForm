<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AppointmentForm.aspx.cs" Inherits="DoctorsAppointmentForm.AppointmentForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link rel="stylesheet" href="StyleSheet1.css"/>
</head>
<body>
    <form  id="register" class="input-group-register" runat="server"> 
   <%-- <div class="headingbox" >
        <h1>WELECOME TO THE CITY HOSPITAL</h1>
    </div>--%>

   <div class="registerbox">
       <img src="doctorAvtar.png" class="avtar" alt=""/>
        <h1>Doctor Appointment</h1>
            
                <asp:label id="label1"  class="lbl" runat="server" text="Full Name"></asp:label>
                <asp:textbox id="txtname" class="txtfull" runat="server" placeholder="Enter Your Full Name"></asp:textbox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtname" ForeColor="Red" runat="server" ErrorMessage="Please Enter Your Full Name"></asp:RequiredFieldValidator>
                <br />     
                <asp:label id="label2"  class="lbl" runat="server" text="Age"></asp:label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:label id="label3"  class="lbl" runat="server" text="Date Of Birth"></asp:label>
                <asp:textbox id="txtage" class="age" runat="server"  placeholder="Enter Your Age"></asp:textbox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:textbox id="txtdob" TextMode="Date" class="inputfield" runat="server"  ></asp:textbox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtdob" ForeColor="Red" runat="server" ErrorMessage="Please Enter Your Age"></asp:RequiredFieldValidator> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;                                                                                                                                                                                 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtage" runat="server" ForeColor="Red" ErrorMessage="Please Select Your DOB"></asp:RequiredFieldValidator>
        
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
                <asp:label id="label4"  class="lbl" runat="server" text="Blood Group"></asp:label>
                <asp:textbox id="txtblood"  class="txtfull" runat="server" placeholder="Enter Your Blood Group"></asp:textbox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtblood" runat="server" ForeColor="Red" ErrorMessage="Please Enter Your Blood Group"></asp:RequiredFieldValidator>
                <br />
                <asp:label id="label5"  class="lbl" runat="server" text="Address"></asp:label>
                <asp:textbox id="txtadd" class="txtfull"  runat="server"  placeholder="Enter Your Full Address"></asp:textbox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtadd" runat="server" ForeColor="Red" ErrorMessage="Please Enter Your Address"></asp:RequiredFieldValidator>
                <br />
                <asp:label id="label7" runat="server" class="lbl" Text="Email-ID"></asp:label>
                <asp:textbox id="txtemail" class="txtfull"  runat="server"  placeholder="Enter Your Email-ID"></asp:textbox><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail" ForeColor="Red" ErrorMessage="Please Enter Correct Email-ID" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"></asp:RegularExpressionValidator>

                <br />
                <asp:label id="label6"  class="lbl" runat="server" text="Mobile Number"></asp:label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:label id="label8"  class="lbl" runat="server" text="Date Of Appointment"></asp:label>
                <br />
                <asp:textbox id="txtno" class="no" runat="server"  placeholder="Enter Your Mobile Number"></asp:textbox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:textbox id="txtdateapp" TextMode="Date"  runat="server"></asp:textbox>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtno" ForeColor="Red" ErrorMessage="Please Enter Coreect Number" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txtdateapp" runat="server" ForeColor="Red" ErrorMessage="Please Select Appointment Date"></asp:RequiredFieldValidator>
               
                <asp:label id="label9"  class="lbl" runat="server" text="Patient Report"></asp:label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:fileupload id="fileupload" class="inputfield" runat="server" Width="229px"  />
                   <%-- <asp:regularexpressionvalidator id="regularexpressionvalidator" forecolor="red" runat="server"
                        controltovalidate="fileupload" validationexpression="^([a-za-z].*|[1-9].*)\.(((p|p)(d|d)(f|f)))$">please select only pdf file </asp:regularexpressionvalidator>--%>
                <br />
                <asp:Label ID="lblmsg" runat="server" ForeColor="Red" Text=""></asp:Label>
                <asp:Button ID="Button1" class="submit-btn" runat="server" Text="Book Appointment" OnClick="Button1_Click" />
            
                
           
        </div>
         </form>
</body>
</html>
