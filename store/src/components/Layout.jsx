import React from "react";
import {
    Link,
    Outlet
  } from "react-router-dom";

function Layout() {
    return (
        <React.Fragment>
            <header>
                <div className="logo">Logo</div>
                <nav>
                    <ul>
                        <li><Link to='/'>Home</Link></li>
                        <li><Link to='/catalog'>Catalog</Link></li>
                    </ul>
                </nav>
            </header>
            <main>
                <Outlet />
            </main>
        </React.Fragment>
    )
}

export default Layout
