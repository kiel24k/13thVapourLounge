<script setup>
import { ref } from 'vue';
import { useRouter } from 'vue-router';

const router = useRouter()
const inputs = ref({})
const inputsValidation = ref({})

const signupBtn = async () => {
  try {
    const response = await axios.post('api/signup', {
      first_name: inputs.value.first_name,
      last_name: inputs.value.last_name,
      middle_name: inputs.value.middle_name,
      email: inputs.value.email,
      password: inputs.value.password
    });
   if(response.status === 200){
    router.push('/login')

   }
    
  } catch (error) {
   console.log(error);
   
    if (error.response.status) {
      inputsValidation.value = error.response.data.errors
    }
  }
}
</script>

<template>
  <div id="signup">
    <div class="signup-body">
      <div class="form">
        <div class="display1">
          <div class="signup-content1">
            <div class="row title">
              <p>Signup</p>
            </div>
            <!-- <div class="row mt-5 signup-with">
              <div class="col">
                <button class="btn">
                  <span>
                    <img src="/public/image/5296499_fb_facebook_facebook logo_icon.png" width="30px" alt="" />
                    Signup with Facebook
                  </span>
                </button>
              </div>
              <div class="col">
                <button class="btn">
                  <span>
                    <img src="/public/image/1920525_gogle_google_logo_network_icon.png" width="30px" alt="" />
                    Signup with Google
                  </span>
                </button>
              </div>
            </div> -->

            <div class="row mt-2">
              <form action="" @submit.prevent>
                <fieldset>
                  <div class="row mt-3">
                    <div class="col">
                      <label for="">First Name</label>
                      <input type="text" class="form-control" v-model="inputs.first_name" />
                      <small v-if="inputsValidation.first_name">{{ inputsValidation.first_name[0] }}</small>
                    </div>
                    <div class="col">
                      <div class="col">
                        <label for="">Middle name: <span class="text-danger">Optional</span></label>
                        <input type="text" class="form-control" v-model="inputs.middle_name" />
                      </div>
                    </div>
                  </div>
                  <div class="row mt-3">
                  <div class="col">
                    <label for="">Last Name</label>
                    <input type="text" class="form-control" v-model="inputs.last_name" />
                    <small v-if="inputsValidation.last_name">{{ inputsValidation.last_name[0] }}</small>  
                  </div>
                  </div>
                  <div class="row mt-3">
                    <div class="col">
                      <label for="">Email</label>
                      <input type="Email" class="form-control" v-model="inputs.email" />
                      <small v-if="inputsValidation.email">{{ inputsValidation.email[0] }}</small>
                    </div>
                  </div>
                  <div class="row mt-3">
                    <div class="col">
                      <label for="">Password</label>
                      <input type="password" class="form-control" v-model="inputs.password" />
                      <small v-if="inputsValidation.password">{{ inputsValidation.password[0] }}</small>
                    </div>
                  </div>
                  <div class="row m-3 create-account-btn">
                    <div class="col text-center">
                      <button class="btn btn-info p-2" @click="signupBtn">
                        Create an account
                      </button>
                    </div>
                  </div>
                  <div class="row mt-3">
                    <div class="col text-center">
                      <span>
                        account already?
                        <router-link :to="{ name: 'login' }">Login</router-link>
                      </span>
                    </div>
                  </div>
                </fieldset>
              </form>
            </div>
          </div>
        </div>
        <div class="display2">d</div>
      </div>
    </div>
  </div>
</template>

<style scoped>
/* For large screens (laptops) */
@media screen and (min-width: 769px) {
  #signup {
    display: grid;
    justify-content: center;
    align-items: center;
    position: absolute;
    height: 100%;
    width: 100%;
    background-color: rgb(240, 240, 240);
  }
  .form small{
    color:red;
  }

  /* .signup-body {
      max-width: 80rem;
      height: 50rem;
      background-image: url('/public/image/web-design-and-development-concept-developer-team-designing-and-creating-a-website-modern.webp');
      box-shadow: 0px 0px 5px 0px gray;
      border-radius: 20px;
      display: grid;
      justify-content: center;
      align-items: center;
    } */

  .form {
    display: flex;
    flex-wrap: wrap;
    box-shadow: 0px 0px 10px 0px gray;
    border-radius: 20px;
  }

  .display1 {
    width: 35rem;
    background-color: white;
    height: 40rem;
    border-top-left-radius: 20px;
    border-bottom-left-radius: 20px;
    padding: 20px;
    display: grid;
    justify-content: center;
    align-items: center;
    margin: auto;
    height: auto;
  }

  .display2 {
    width: 35rem;
    height: 40rem;
    background-image: url('/public/image/vintage-typographic-business-banner-design-vector-1581336.avif');
    background-size: cover;
    border-top-right-radius: 20px;
    border-bottom-right-radius: 20px;
    background-position: 50%;
    background-size: cover;
  }

  .title p {
    font-weight: 600;
    font-size: 50px;
  }

  .checkbox {
    display: flex;
    align-items: start;
    justify-content: center;
    align-content: center;
    gap: 10px;
  }

  .signup-with button {
    padding: 10px;
    background-color: white;
    display: flex;
    align-items: center;
    font-size: 15px;
    border: 1px solid black;
    transition: all linear 0.2s;
  }

  .signup-with button:hover {
    border: solid 1px black;
    background: black;
    color: white;
  }

  .create-account-btn button {
    background-color: rgb(30, 83, 228);
    color: White;
    border: 0;
  }

  .create-account-btn button:hover {
    background-color: black;
    color: white;
  }
}

/* For small screens (phones) */
@media screen and (max-width: 1116px) {
  #signup {
    display: grid;
    justify-content: center;
    align-items: center;
    position: absolute;
    height: 100%;
    width: 100%;
    background-color: rgb(240, 240, 240);
  }

  .form {
    display: flex;
    flex-wrap: wrap;
    box-shadow: 0px 0px 10px 0px gray;
    border-radius: 20px;
    margin: 20px;
  }

  .display1 {
    max-width: 35rem;
    background-color: white;
    height: auto;
    border-radius: 20px;
    padding: 20px;
    display: grid;
    justify-content: center;
    align-items: center;
    margin: auto;
  }

  .display2 {
    display: none;
  }

  .title p {
    font-weight: 600;
    font-size: 50px;
  }

  .checkbox {
    display: flex;
    align-items: start;
    justify-content: center;
    align-content: center;
    gap: 10px;
  }

  .signup-with button {
    padding: 10px;
    background-color: white;
    display: flex;
    align-items: center;
    font-size: 15px;
    border: 1px solid black;
    transition: all linear 0.2s;
  }

  .signup-with button:hover {
    border: solid 1px black;
    background: black;
    color: white;
  }

  .create-account-btn button {
    background-color: rgb(30, 83, 228);
    color: White;
    border: 0;
  }

  .create-account-btn button:hover {
    background-color: black;
    color: white;
  }
}

/* For medium screens (tablets) */
@media screen and (min-width: 601px) and (max-width: 768px) {
  .element {
    /* Apply styles for medium screens */
  }
}
</style>