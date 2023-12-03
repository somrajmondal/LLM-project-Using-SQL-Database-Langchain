from main import few_shot_db_chains
import streamlit as st

# Set colorful background
st.markdown(
    """
    <style>
        body {
            background-color: #f0f5f5;
        }
    </style>
    """,
    unsafe_allow_html=True
)

# Add an icon and playful text to the header
st.header('🚀 Explore the T-Shirt Universe', divider='rainbow')

# Add a disclaimer about the model and ownership
st.info("ℹ️ Using LLM (Large Language Model) with few-shot tuning. \n\n"
         )

st.subheader('Unleash Your Curiosity! Get T-shirt information ')

question = st.text_input('Ask a Question')

if question:
    # Connect to the internal database
    connection = few_shot_db_chains()

    answer = connection.run(question)

    st.header('🌌 Your Answer:')
    st.balloons()
    st.write(answer)

    # Display an image related to the answer (replace 'path/to/image.jpg' with the actual image path)

    st.success('🚀 Woohoo! You just unlocked your query')

st.balloons()
st.markdown('### Keep the questions coming! The T-Shirt Cosmos awaits your curiosity. 🌟')
