import get from 'lodash/get';

export default function Home({ idp }) {
  return (
    <>
      <p>
        Identity Provider: <span id="idp">{idp}</span>
      </p>
      <form action="/login" method="post">
        <input id="login" type="submit" value="Login" />
      </form>
    </>
  );
}

const getIdentityProvider = (req) => {
  const idp = get(req, 'kauth.grant.id_token.content.identity_provider');
  return idp;
};

export async function getServerSideProps({ req, res, query: params }) {
  const idp = getIdentityProvider(req);

  return {
    props: { idp: idp || '' },
  };
}
