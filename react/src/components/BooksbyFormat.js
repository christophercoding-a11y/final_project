
import { useState, useEffect } from "react"
import { useParams } from "react-router"
import axios from "axios"
import BookCard from "./BookCard"




const BooksByFormat =()=> {

    const [ bookformat, setBookFormat ] = useState([])

    const params = useParams()

    useEffect(()=> {
    const url = `http://localhost:3005/api/format/format/${params.id}`
    axios.get(url).then(res => setBookFormat(res.data))
}, [params.id])

const formatName = bookformat.length > 0 ? bookformat[0].format : "this format";

    const BookCardComponents = bookformat.map(book => {
        return (
            <BookCard
                key={book.book_id}
                id={book.book_id}
                title={book.title}
                cover_image={book.cover_image}
            />
        )
    })

        return (
        <main className="main" id="allBooksMain">
            <div className="container">
                <h2 className="text-capitalize author-heading text-capitalize mb-4">all {formatName} books</h2>
                <section className="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4">
                    { BookCardComponents }
                </section>
            </div>
        </main>
    )


}




export default BooksByFormat