export default{
  handleLogin({commit},data){

        axios.post('/api/v1/login',data)
        .then((res)=>{
            commit('hanleLogin',res.data);
        })
        .catch(e=>{
            console.log(e);
        })
  }
}