'use server';

import { redirect } from 'next/navigation';
import { cookies } from 'next/headers';

export async function submitReply(formData, board, thred) {
  let obj = {};
  obj.post = {};
  formData.forEach((value, key) => obj.post[key] = value);
  let json = JSON.stringify(obj);

  let res = await fetch(`http://localhost:3000/boards/${board}/threds/${thred}/posts`, {
    method: 'POST',
    body: json,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${cookies().get('token').value}`
    }
  });
}

export async function submitThred(formData, board) {
  let obj = {};
  obj.thred = {};
  formData.forEach((value, key) => obj.thred[key] = value);
  let json = JSON.stringify(obj);

  let res = await fetch(`http://localhost:3000/boards/${board}/threds`, {
    method: 'POST',
    body: json,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${cookies().get('token').value}`
    }
  });
}

export async function submitLogin(formData) {
  let obj = {};
  formData.forEach((value, key) => obj[key] = value);
  let json = JSON.stringify(obj);

  let res = await fetch(`http://localhost:3000/auth/login`, {
    method: 'POST',
    body: json,
    headers: {
      'Content-Type': 'application/json'
    }
  });

  if (res.ok) {
    json = await res.json();
    cookies().set('token', json.token, { httpOnly: true, secure: true, path: '/' });
  }
}

export async function getResources({ board, thred }) {
  let res, obj = {};

  if (thred) {
    res = await fetch(`http://localhost:3000/boards/${board}`, {
      headers: {
        'Authorization': `Bearer ${cookies().get('token').value}`
      }
    });
  
    obj.board = await res.json();
  
    res = await fetch(`http://localhost:3000/boards/${board}/threds/${thred}`, {
      headers: {
        'Authorization': `Bearer ${cookies().get('token').value}`
      }
    });
  
    obj.thred = await res.json();
  }
  
  else if (board) {
    res = await fetch(`http://localhost:3000/boards/${board}`, {
      headers: {
        'Authorization': `Bearer ${cookies().get('token').value}`
      }
    });
  
    obj.board = await res.json();
  
    res = await fetch(`http://localhost:3000/boards/${board}/threds`, {
      headers: {
        'Authorization': `Bearer ${cookies().get('token').value}`
      }
    });
  
    obj.index = await res.json();
  }

  else {
    res = await fetch('http://localhost:3000/boards', {
      headers: {
        'Authorization': `Bearer ${cookies().get('token').value}`
      }
    });

    obj.boards = await res.json();
  }

  return obj;
}