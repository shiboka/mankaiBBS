import { getResources } from "@/actions/serverActions";

export async function NavBar() {
    const { boards } = await getResources({});

    return (
        <div className="navbar">
            <a href="/">Home | </a>
            {boards.map((board) => (
                <a href={"/" + board.path + "/"}>/{board.path}/ </a>
            ))}
        </div>
    );
}