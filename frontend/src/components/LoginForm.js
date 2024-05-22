'use client';

import { useRef } from 'react';
import { submitLogin } from '@/actions/serverActions';

export function LoginForm() {
  const ref = useRef(null);

  const handleSubmit = async(event) => {
    event.preventDefault();
    let formData = new FormData(event.currentTarget);
    ref.current?.reset();
    submitLogin(formData);
  };

  return(
    <form ref={ref} onSubmit={handleSubmit}>
      <label htmlFor='username'>Username: </label>
      <input type='text' name='username' /><br />
      <label htmlFor='password'>Password: </label>
      <input type='text' name='password' /><br />
      <input type='submit' value='Login' />
    </form>
  );
}
