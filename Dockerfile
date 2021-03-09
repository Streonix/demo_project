FROM python:3.9
ARG SECRET_KEY=${SECRET_KEY}

# set the working directory in the container
WORKDIR /code

# install pip, upgrade it and install pipenv
RUN pip install --upgrade pip && pip install pipenv

# copy the dependencies file to the working directory
COPY Pipfile* .

# install dependencies
RUN pipenv install --system --deploy --ignore-pipfile

# copy entrypoint.sh to use it as an entrypoint for this image
COPY entrypoint.sh entrypoint.sh

# copy the content of the local src directory to the working directory
COPY src/ .

# collect static files
RUN python manage.py collectstatic --noinput

# set volumes
VOLUME /code/static
VOLUME /code/media

# give execute rights for entrypoint.sh
RUN chmod +x /code/entrypoint.sh

EXPOSE 8000

ENTRYPOINT ["/code/entrypoint.sh"]
